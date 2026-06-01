# Data-блоки для существующей сети и подсети
data "yandex_vpc_network" "develop" {
  name = "default"
}

data "yandex_vpc_subnet" "develop" {
  name = "default-ru-central1-a"
}
# Образ Ubuntu
resource "yandex_compute_image" "ubuntu" {
  source_family = var.vm_web_image_family
}

# Web VM
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.ubuntu.id
      size     = var.vms_resources["web"].disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.common_metadata
}

# DB VM
resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.ubuntu.id
      size     = var.vms_resources["db"].disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.common_metadata
}
