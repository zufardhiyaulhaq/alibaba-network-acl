## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | 1.220.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.220.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_network_acl.application](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/network_acl) | resource |
| [alicloud_network_acl_attachment.application](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/network_acl_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_ingress_application_rules"></a> [additional\_ingress\_application\_rules](#input\_additional\_ingress\_application\_rules) | List of additional ingress rules for application subnet ACL | <pre>map(object({<br>    name           = string<br>    policy         = string<br>    protocol       = string<br>    port           = string<br>    source_cidr_ip = string<br>  }))</pre> | `{}` | no |
| <a name="input_application_subnets_cidr"></a> [application\_subnets\_cidr](#input\_application\_subnets\_cidr) | List of application subnets CIDR | `list(string)` | n/a | yes |
| <a name="input_application_subnets_id"></a> [application\_subnets\_id](#input\_application\_subnets\_id) | List of application subnets ID | `list(string)` | n/a | yes |
| <a name="input_compliance_subnets_cidr"></a> [compliance\_subnets\_cidr](#input\_compliance\_subnets\_cidr) | List of compliance subnets CIDR | `list(string)` | n/a | yes |
| <a name="input_compliance_subnets_id"></a> [compliance\_subnets\_id](#input\_compliance\_subnets\_id) | List of compliance subnets ID | `list(string)` | n/a | yes |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | Enviroment label | `string` | n/a | yes |
| <a name="input_label_team"></a> [label\_team](#input\_label\_team) | Team label | `string` | n/a | yes |
| <a name="input_public_subnets_cidr"></a> [public\_subnets\_cidr](#input\_public\_subnets\_cidr) | List of public subnets CIDR | `list(string)` | n/a | yes |
| <a name="input_public_subnets_id"></a> [public\_subnets\_id](#input\_public\_subnets\_id) | List of public subnets ID | `list(string)` | n/a | yes |
| <a name="input_stateful_subnets_cidr"></a> [stateful\_subnets\_cidr](#input\_stateful\_subnets\_cidr) | List of stateful subnets CIDR | `list(string)` | n/a | yes |
| <a name="input_stateful_subnets_id"></a> [stateful\_subnets\_id](#input\_stateful\_subnets\_id) | List of stateful subnets ID | `list(string)` | n/a | yes |
| <a name="input_utility_subnets_cidr"></a> [utility\_subnets\_cidr](#input\_utility\_subnets\_cidr) | List of utility subnets CIDR | `list(string)` | n/a | yes |
| <a name="input_utility_subnets_id"></a> [utility\_subnets\_id](#input\_utility\_subnets\_id) | List of utility subnets ID | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
