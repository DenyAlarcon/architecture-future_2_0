variable "vm_name" {
  description = "Имя виртуальной машины."
  type        = string
}

variable "zone" {
  description = "Зона доступности, в которой создаются ВМ и диск."
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
  description = "Размер подключаемого загрузочного диска в ГБ."
  type        = number
}

variable "disk_type" {
  description = "Тип подключаемого диска."
  type        = string
  default     = "network-hdd"
}

variable "subnet_id" {
  description = "ID подсети для сетевого интерфейса ВМ."
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ для доступа к ВМ."
  type        = string
}

variable "ssh_user" {
  description = "Пользователь для SSH-доступа."
  type        = string
  default     = "ubuntu"
}

variable "image_family" {
  description = "Семейство образа ОС."
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "platform_id" {
  description = "Платформа ВМ."
  type        = string
  default     = "standard-v1"
}

variable "nat" {
  description = "Нужно ли выдавать ВМ публичный IP-адрес."
  type        = bool
  default     = true
}
