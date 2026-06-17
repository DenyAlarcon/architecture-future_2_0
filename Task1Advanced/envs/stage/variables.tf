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
}

variable "vm_name" {
  description = "Имя ВМ."
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
  description = "Размер диска в ГБ."
  type        = number
}

variable "disk_type" {
  description = "Тип диска."
  type        = string
}

variable "subnet_id" {
  description = "ID подсети."
  type        = string
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH-ключу."
  type        = string
}

variable "ssh_user" {
  description = "Пользователь для SSH."
  type        = string
  default     = "ubuntu"
}

variable "nat" {
  description = "Нужно ли выдавать публичный IP."
  type        = bool
}
