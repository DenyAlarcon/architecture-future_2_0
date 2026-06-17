module "vm_module" {
  source = "../../modules/vm"

  vm_name   = var.vm_name
  zone      = var.zone
  cores     = var.cores
  memory    = var.memory
  disk_size = var.disk_size
  disk_type = var.disk_type
  subnet_id = var.subnet_id
  ssh_key   = file(pathexpand(var.ssh_public_key_path))
  ssh_user  = var.ssh_user
  nat       = var.nat
}
