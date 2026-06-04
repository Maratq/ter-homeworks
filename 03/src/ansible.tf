# Подготовка списков для шаблона
locals {
  web_vms_list = [for vm in yandex_compute_instance.web : {
    name = vm.name
    ip   = vm.network_interface[0].ip_address  # внутренний IP
    fqdn = vm.fqdn
  }]
  
  db_vms_list = [for name, vm in yandex_compute_instance.db : {
    name = vm.name
    ip   = vm.network_interface[0].ip_address
    fqdn = vm.fqdn
  }]
  
  storage_vm_map = {
    name = yandex_compute_instance.storage.name
    ip   = yandex_compute_instance.storage.network_interface[0].ip_address
    fqdn = yandex_compute_instance.storage.fqdn
  }
}

# Создание inventory файла
resource "local_file" "inventory" {
  content = templatefile("${path.module}/hosts.tftpl", {
    web_vms     = local.web_vms_list
    db_vms      = local.db_vms_list
    storage_vm  = local.storage_vm_map
  })
  filename = "inventory.ini"
}
