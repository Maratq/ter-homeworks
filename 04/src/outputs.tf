output "marketing_vm_external_ip" {
  value = module.marketing_vm.external_ip
  description = "External IP of marketing VM"
}

output "analytics_vm_external_ip" {
  value = module.analytics_vm.external_ip
  description = "External IP of analytics VM"
}

output "marketing_vm_labels" {
  value = module.marketing_vm.vm_labels
  description = "Labels of marketing VM"
}

output "analytics_vm_labels" {
  value = module.analytics_vm.vm_labels
  description = "Labels of analytics VM"
}

output "marketing_vm_name" {
  value = module.marketing_vm.vm_name
  description = "Name of marketing VM"
}

output "analytics_vm_name" {
  value = module.analytics_vm.vm_name
  description = "Name of analytics VM"
}

output "vpc_network_id" {
  value = module.vpc_dev.network_id
  description = "VPC network ID"
}

output "vpc_subnet_id" {
  value = module.vpc_dev.subnet_id
  description = "VPC subnet ID"
}

output "vpc_subnet_cidr" {
  value = module.vpc_dev.subnet_cidr
  description = "VPC subnet CIDR"
}
