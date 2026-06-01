locals {
  # Имена ВМ с использованием интерполяции
  vm_web_name = "${var.vm_web_name}"
  vm_db_name  = "${var.vm_db_name}"
  
  # Общая metadata для всех ВМ
  common_metadata = {
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
