variable "yc_token" {
  description = "OAuth-токен или IAM-токен Yandex Cloud."
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "ID облака Yandex Cloud."
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud."
  type        = string
}

variable "zone" {
  description = "Зона доступности."
  type        = string
  default     = "ru-central1-a"
}

variable "vm_name" {
  description = "Имя виртуальной машины."
  type        = string
}

variable "cores" {
  description = "Количество ядер ВМ."
  type        = number
}

variable "memory" {
  description = "Объём RAM в ГБ."
  type        = number
}

variable "disk_size" {
  description = "Размер загрузочного диска в ГБ."
  type        = number
}

variable "disk_type" {
  description = "Тип загрузочного диска."
  type        = string
  default     = "network-hdd"
}

variable "subnet_id" {
  description = "ID подсети."
  type        = string
}

variable "ssh_user" {
  description = "Пользователь для SSH-доступа."
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ."
  type        = string
  sensitive   = true
}

variable "image_family" {
  description = "Семейство образа ОС."
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "nat" {
  description = "Нужно ли выдавать ВМ публичный IP."
  type        = bool
  default     = true
}
