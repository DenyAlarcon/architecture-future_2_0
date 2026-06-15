data "yandex_compute_image" "os" {
  family = var.image_family
}

resource "yandex_compute_disk" "boot" {
  name     = "${var.vm_name}-boot-disk"
  type     = var.disk_type
  zone     = var.zone
  size     = var.disk_size
  image_id = data.yandex_compute_image.os.image_id
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  hostname    = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${trimspace(var.ssh_key)}"
  }
}
