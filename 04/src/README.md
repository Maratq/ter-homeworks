## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.12.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | ~> 0.130 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.206.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics_vm"></a> [analytics\_vm](#module\_analytics\_vm) | ./modules/vm | n/a |
| <a name="module_marketing_vm"></a> [marketing\_vm](#module\_marketing\_vm) | ./modules/vm | n/a |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_vm"></a> [analytics\_vm](#input\_analytics\_vm) | ## Analytics VM config | <pre>object({<br/>    name    = string<br/>    project = string<br/>    env     = string<br/>    cores   = number<br/>    memory  = number<br/>  })</pre> | <pre>{<br/>  "cores": 2,<br/>  "env": "prod",<br/>  "memory": 2,<br/>  "name": "analytics-vm",<br/>  "project": "analytics"<br/>}</pre> | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Yandex Cloud ID | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | Default availability zone | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Yandex Folder ID | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | Ubuntu image ID | `string` | `"fd8271s93s3p5dhe1d9h"` | no |
| <a name="input_marketing_vm"></a> [marketing\_vm](#input\_marketing\_vm) | ## Marketing VM config | <pre>object({<br/>    name    = string<br/>    project = string<br/>    env     = string<br/>    cores   = number<br/>    memory  = number<br/>  })</pre> | <pre>{<br/>  "cores": 2,<br/>  "env": "prod",<br/>  "memory": 2,<br/>  "name": "marketing-vm",<br/>  "project": "marketing"<br/>}</pre> | no |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | Path to SSH public key | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | VM username | `string` | `"ubuntu"` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | ## VPC module config | <pre>object({<br/>    name = string<br/>    zone = string<br/>    cidr = string<br/>  })</pre> | <pre>{<br/>  "cidr": "10.0.1.0/24",<br/>  "name": "develop",<br/>  "zone": "ru-central1-b"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_analytics_vm_external_ip"></a> [analytics\_vm\_external\_ip](#output\_analytics\_vm\_external\_ip) | External IP of analytics VM |
| <a name="output_analytics_vm_labels"></a> [analytics\_vm\_labels](#output\_analytics\_vm\_labels) | Labels of analytics VM |
| <a name="output_analytics_vm_name"></a> [analytics\_vm\_name](#output\_analytics\_vm\_name) | Name of analytics VM |
| <a name="output_marketing_vm_external_ip"></a> [marketing\_vm\_external\_ip](#output\_marketing\_vm\_external\_ip) | External IP of marketing VM |
| <a name="output_marketing_vm_labels"></a> [marketing\_vm\_labels](#output\_marketing\_vm\_labels) | Labels of marketing VM |
| <a name="output_marketing_vm_name"></a> [marketing\_vm\_name](#output\_marketing\_vm\_name) | Name of marketing VM |
| <a name="output_vpc_network_id"></a> [vpc\_network\_id](#output\_vpc\_network\_id) | VPC network ID |
| <a name="output_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#output\_vpc\_subnet\_cidr) | VPC subnet CIDR |
| <a name="output_vpc_subnet_id"></a> [vpc\_subnet\_id](#output\_vpc\_subnet\_id) | VPC subnet ID |
