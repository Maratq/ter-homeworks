output "vm_id" {
  value = yandex_compute_instance.this.id
  description = "VM ID"
}

output "vm_name" {
  value = yandex_compute_instance.this.name
  description = "VM name"
}

output "vm_labels" {
  value = yandex_compute_instance.this.labels
  description = "VM labels"
}

output "external_ip" {
  value = yandex_compute_instance.this.network_interface[0].nat_ip_address
  description = "External IP address"
}

output "internal_ip" {
  value = yandex_compute_instance.this.network_interface[0].ip_address
  description = "Internal IP address"
}
