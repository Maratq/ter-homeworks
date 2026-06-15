# VPC module (использует существующую сеть default и подсеть develop)
module "vpc_dev" {
  source       = "./modules/vpc"
  network_name = "default"
  env_name     = "develop"
  zone         = var.default_zone
  cidr         = "10.0.2.0/24"
}

# Cloud-init template
locals {
  cloudinit = templatefile("${path.module}/templates/cloud-init.yml.tpl", {
    username       = var.username
    ssh_public_key = file(var.ssh_public_key_path)
  })
}

# Marketing VM module
module "marketing_vm" {
  source = "./modules/vm"

  vm_name   = var.marketing_vm.name
  vm_labels = {
    project = var.marketing_vm.project
    env     = var.marketing_vm.env
  }
  zone         = var.default_zone
  folder_id    = var.folder_id
  image_id     = var.image_id
  subnet_id    = module.vpc_dev.subnet_id
  network_id   = module.vpc_dev.network_id
  user_data    = local.cloudinit
  cores        = var.marketing_vm.cores
  memory       = var.marketing_vm.memory
}

# Analytics VM module
module "analytics_vm" {
  source = "./modules/vm"

  vm_name   = var.analytics_vm.name
  vm_labels = {
    project = var.analytics_vm.project
    env     = var.analytics_vm.env
  }
  zone         = var.default_zone
  folder_id    = var.folder_id
  image_id     = var.image_id
  subnet_id    = module.vpc_dev.subnet_id
  network_id   = module.vpc_dev.network_id
  user_data    = local.cloudinit
  cores        = var.analytics_vm.cores
  memory       = var.analytics_vm.memory
}
