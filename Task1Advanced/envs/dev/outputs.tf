output "vm_id" {
  description = "ID виртуальной машины."
  value       = module.vm_module.vm_id
}

output "vm_name" {
  description = "Имя виртуальной машины."
  value       = module.vm_module.vm_name
}

output "internal_ip_address" {
  description = "Внутренний IP-адрес ВМ."
  value       = module.vm_module.internal_ip_address
}

output "external_ip_address" {
  description = "Внешний IP-адрес ВМ."
  value       = module.vm_module.external_ip_address
}

output "boot_disk_id" {
  description = "ID подключаемого диска."
  value       = module.vm_module.boot_disk_id
}
