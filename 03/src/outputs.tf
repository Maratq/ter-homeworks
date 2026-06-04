# Output для всех ВМ в виде списка словарей
output "all_vms_list" {
  description = "List of all VMs with name, id and fqdn"
  value = concat(
    # ВМ из count (web-1, web-2)
    [for vm in yandex_compute_instance.web : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }],
    # ВМ из for_each (main, replica)
    [for name, vm in yandex_compute_instance.db : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }],
    # ВМ storage
    [{
      name = yandex_compute_instance.storage.name
      id   = yandex_compute_instance.storage.id
      fqdn = yandex_compute_instance.storage.fqdn
    }]
  )
}
