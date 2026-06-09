## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | ~> 0.130 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.206.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_subnet.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_network.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR block for the subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name (used for subnet naming) | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of existing VPC network | `string` | `"default"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Yandex Cloud availability zone | `string` | `"ru-central1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the VPC network |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | CIDR block of the subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of the created subnet |
| <a name="output_subnet_zone"></a> [subnet\_zone](#output\_subnet\_zone) | Zone of the subnet |
