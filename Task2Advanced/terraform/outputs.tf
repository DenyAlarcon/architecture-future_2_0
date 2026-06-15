output "vm_id" {
  description = "ID виртуальной машины."
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины."
  value       = yandex_compute_instance.vm.name
}

output "internal_ip_address" {
  description = "Внутренний IP-адрес ВМ."
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  description = "Внешний IP-адрес ВМ."
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "boot_disk_id" {
  description = "ID загрузочного диска."
  value       = yandex_compute_disk.boot.id
}
