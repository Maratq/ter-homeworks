### vm_web variables

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the web VM"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Image family for web VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for web VM"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Availability zone for web VM"
}

# Закомментированы, так как заменены на vms_resources
# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "Number of CPU cores for web VM"
# }
# 
# variable "vm_web_memory" {
#   type        = number
#   default     = 2
#   description = "Memory in GB for web VM"
# }
# 
# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Core fraction for web VM"
# }
# 
# variable "vm_web_disk_size" {
#   type        = number
#   default     = 10
#   description = "Boot disk size in GB for web VM"
# }

### vm_db variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the database VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for database VM"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Availability zone for database VM"
}

# Закомментированы, так как заменены на vms_resources
# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "Number of CPU cores for database VM"
# }
# 
# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "Memory in GB for database VM"
# }
# 
# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Core fraction for database VM"
# }
# 
# variable "vm_db_disk_size" {
#   type        = number
#   default     = 10
#   description = "Boot disk size in GB for database VM"
# }

# Новая map-переменная для ресурсов ВМ
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
  }))
  description = "Resources for each VM"
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
    }
  }
}
