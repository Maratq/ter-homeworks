variable "network_name" {
  description = "Name of existing VPC network"
  type        = string
  default     = "default"
}

variable "env_name" {
  description = "Environment name (used for subnet naming)"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud availability zone"
  type        = string
  default     = "ru-central1-b"
}

variable "cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}
