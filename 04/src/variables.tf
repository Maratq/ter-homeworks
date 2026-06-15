###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Folder ID"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default availability zone"
}

###common vars
variable "username" {
  type        = string
  default     = "ubuntu"
  description = "VM username"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to SSH public key"
}

variable "image_id" {
  type        = string
  default     = "fd8271s93s3p5dhe1d9h"
  description = "Ubuntu image ID"
}

### VPC module config

### Marketing VM config
variable "marketing_vm" {
  type = object({
    name    = string
    project = string
    env     = string
    cores   = number
    memory  = number
  })
  default = {
    name    = "marketing-vm"
    project = "marketing"
    env     = "prod"
    cores   = 2
    memory  = 2
  }
}

### Analytics VM config
variable "analytics_vm" {
  type = object({
    name    = string
    project = string
    env     = string
    cores   = number
    memory  = number
  })
  default = {
    name    = "analytics-vm"
    project = "analytics"
    env     = "prod"
    cores   = 2
    memory  = 2
  }
}



