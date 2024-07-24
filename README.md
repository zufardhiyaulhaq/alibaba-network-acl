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
| <a name="input_application_subnets_id"></a> [application\_subnets\_id](#input\_application\_subnets\_id) | List of application subnets ID | `list(string)` | n/a | yes |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | Enviroment label | `string` | n/a | yes |
| <a name="input_label_team"></a> [label\_team](#input\_label\_team) | Team label | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
