# Задание 2. CI/CD и удалённое состояние Terraform

Решение автоматизирует развёртывание инфраструктуры через GitHub Actions и хранит состояние Terraform в S3-совместимом хранилище.

## Что внутри

- `terraform/versions.tf` — провайдер Yandex Cloud и backend `s3`.
- `terraform/main.tf` — пример инфраструктуры: ВМ, загрузочный диск и сеть.
- `terraform/backend.hcl.example` — пример настройки S3-compatible backend.
- `terraform/terraform.tfvars.example` — пример входных параметров.
- `.github/workflows/task2-terraform.yml` — CI/CD pipeline.

## Backend

Backend объявлен пустым блоком:

```hcl
backend "s3" {}
```

Конкретные значения передаются при `terraform init`, чтобы не хранить настройки окружения и секреты в коде:

```bash
terraform init -backend-config=backend.hcl
```

Для Yandex Object Storage пример `backend.hcl`:

```hcl
bucket = "future-terraform-state"
key    = "task2/prod/terraform.tfstate"
region = "ru-central1"

endpoints = {
  s3 = "https://storage.yandexcloud.net"
}

skip_credentials_validation = true
skip_region_validation      = true
skip_requesting_account_id  = true
skip_s3_checksum            = true
use_path_style              = true
```

S3-ключи передаются через переменные окружения:

```bash
export AWS_ACCESS_KEY_ID="<access-key>"
export AWS_SECRET_ACCESS_KEY="<secret-key>"
```

Токен облака тоже лучше передавать через переменную окружения, а не хранить в `terraform.tfvars`:

```bash
export TF_VAR_yc_token="<token>"
```

## Локальный запуск

```bash
cd Task2Advanced/terraform
cp backend.hcl.example backend.hcl
cp terraform.tfvars.example terraform.tfvars
```

Заменить значения в `backend.hcl` и `terraform.tfvars`, затем выполнить:

```bash
terraform init -backend-config=backend.hcl
terraform fmt -check -recursive
terraform validate
terraform plan
terraform apply
```

## GitHub Actions

Pipeline находится в `.github/workflows/task2-terraform.yml`.

Он выполняет:

- в pull request: `terraform init -backend=false`, `terraform fmt`, `terraform validate`;
- вне pull request: `terraform init` с удалённым backend;
- `terraform fmt`;
- `terraform validate`;
- `terraform plan` только вне pull request, когда доступны GitHub Secrets и Variables;
- `terraform apply` только вручную через `workflow_dispatch` с параметром `action=apply`.

Для дополнительного контроля `apply` привязан к GitHub Environment `production`. В настройках репозитория можно включить обязательное approval для этого environment.

В pull request секреты могут быть недоступны, поэтому удалённый backend и `terraform plan` там не запускаются. Это позволяет проверить код Terraform без передачи облачных ключей в PR.

## Secrets

В GitHub Secrets нужно добавить:

| Secret | Назначение |
| --- | --- |
| `YC_TOKEN` | Токен Yandex Cloud |
| `YC_CLOUD_ID` | ID облака |
| `YC_FOLDER_ID` | ID каталога |
| `YC_SUBNET_ID` | ID подсети |
| `SSH_PUBLIC_KEY` | Публичный SSH-ключ |
| `S3_ACCESS_KEY_ID` | Access key для S3 backend |
| `S3_SECRET_ACCESS_KEY` | Secret key для S3 backend |

## Variables

В GitHub Variables нужно добавить:

| Variable | Пример |
| --- | --- |
| `YC_ZONE` | `ru-central1-a` |
| `TF_VM_NAME` | `future-task2-vm` |
| `TF_VM_CORES` | `2` |
| `TF_VM_MEMORY` | `2` |
| `TF_VM_DISK_SIZE` | `20` |
| `TF_VM_DISK_TYPE` | `network-hdd` |
| `TF_VM_NAT` | `true` |
| `TF_SSH_USER` | `ubuntu` |
| `TF_BACKEND_BUCKET` | `future-terraform-state` |
| `TF_BACKEND_KEY` | `task2/prod/terraform.tfstate` |
| `TF_BACKEND_REGION` | `ru-central1` |
| `TF_BACKEND_ENDPOINT` | `https://storage.yandexcloud.net` |

## Безопасность

- Секреты не хранятся в репозитории.
- `terraform.tfstate` не хранится локально и не коммитится.
- `apply` запускается только вручную.
- GitHub Environment `production` можно настроить на обязательное подтверждение.
