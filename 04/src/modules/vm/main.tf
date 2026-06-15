# Security group для ВМ
resource "yandex_vpc_security_group" "this" {
  name        = "${var.vm_name}-sg"
  description = "Security group for ${var.vm_name}"
  network_id  = var.network_id

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all outgoing"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}

resource "yandex_compute_instance" "this" {
  # checkov:skip=CKV_YC_2: Public IP required for external access
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
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.this.id]
  }

  metadata = {
    user-data = var.user_data
  }

  labels = var.vm_labels
}
