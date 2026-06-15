# Задание 1. Модульная инфраструктура для нескольких сред

Решение содержит универсальный Terraform-модуль для создания виртуальной машины в Yandex Cloud и три окружения: `dev`, `stage`, `prod`.

## Структура

```text
Task1Advanced/
  modules/
    vm/
      main.tf
      variables.tf
      outputs.tf
  envs/
    dev/
    stage/
    prod/
```

## Что создаёт модуль

- образ ОС по `image_family`;
- загрузочный диск;
- виртуальную машину;
- сетевой интерфейс в указанной подсети;
- SSH-доступ по публичному ключу.

## Основные параметры модуля

| Параметр | Описание |
| --- | --- |
| `cores` | Количество ядер ВМ |
| `memory` | Объём RAM в ГБ |
| `disk_size` | Размер подключаемого диска в ГБ |
| `disk_type` | Тип подключаемого диска |
| `subnet_id` | ID подсети |
| `ssh_key` | Публичный SSH-ключ |

## Выходные значения

- `vm_id`;
- `vm_name`;
- `internal_ip_address`;
- `external_ip_address`;
- `boot_disk_id`;
- `subnet_id`.

## Как запустить

Перед запуском нужно заменить значения `replace-with-*` в нужном `.tfvars` на свои `cloud_id`, `folder_id` и `subnet_id`.

Токен Yandex Cloud лучше передавать через переменную окружения:

```bash
export YC_TOKEN="<OAuth-токен>"
```

Запуск для `dev`:

```bash
cd Task1Advanced/envs/dev
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
```

Запуск для `stage`:

```bash
cd Task1Advanced/envs/stage
terraform init
terraform plan -var-file=stage.tfvars
terraform apply -var-file=stage.tfvars
```

Запуск для `prod`:

```bash
cd Task1Advanced/envs/prod
terraform init
terraform plan -var-file=prod.tfvars
terraform apply -var-file=prod.tfvars
```
