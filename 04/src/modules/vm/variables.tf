variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_labels" {
  type        = map(string)
  default     = {}
  description = "Labels for the VM"
}

variable "zone" {
  type        = string
  description = "Availability zone"
}

variable "folder_id" {
  type        = string
  description = "Folder ID"
}

variable "image_id" {
  type        = string
  description = "Image ID for boot disk"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for network interface"
}

variable "user_data" {
  type        = string
  description = "Cloud-init user data"
  default     = ""
}

variable "cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores"
}

variable "memory" {
  type        = number
  default     = 2
  description = "Memory in GB"
}

variable "core_fraction" {
  type        = number
  default     = 5
  description = "Core fraction"
}

variable "network_id" {
  description = "VPC network ID"
  type        = string
}
