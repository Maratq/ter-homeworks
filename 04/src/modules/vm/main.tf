resource "yandex_compute_instance" "this" {
  name        = var.vm_name
  platform_id = "standard-v2"
  zone        = var.zone
  folder_id   = var.folder_id

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = var.user_data
  }

  labels = var.vm_labels
}
