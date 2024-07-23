## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | 1.81.111 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | 1.81.111 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_eip.application_nat_eip](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/eip) | resource |
| [tencentcloud_eip.general_nat_eip](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/eip) | resource |
| [tencentcloud_eip.reserved_nat_ip](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/eip) | resource |
| [tencentcloud_nat_gateway.application_nat](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/nat_gateway) | resource |
| [tencentcloud_nat_gateway.general_nat](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/nat_gateway) | resource |
| [tencentcloud_private_dns_zone.private_dns](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/private_dns_zone) | resource |
| [tencentcloud_route_entry.rtb_application_default_gateway](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_entry) | resource |
| [tencentcloud_route_entry.rtb_compliance_default_gateway](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_entry) | resource |
| [tencentcloud_route_entry.rtb_public_default_gateway](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_entry) | resource |
| [tencentcloud_route_entry.rtb_stateful_default_gateway](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_entry) | resource |
| [tencentcloud_route_entry.rtb_utility_default_gateway](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_entry) | resource |
| [tencentcloud_route_table.application_route_table](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_table) | resource |
| [tencentcloud_route_table.compliance_route_table](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_table) | resource |
| [tencentcloud_route_table.public_route_table](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_table) | resource |
| [tencentcloud_route_table.stateful_route_table](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_table) | resource |
| [tencentcloud_route_table.utility_route_table](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/route_table) | resource |
| [tencentcloud_subnet.application_subnets](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/subnet) | resource |
| [tencentcloud_subnet.compliance_subnets](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/subnet) | resource |
| [tencentcloud_subnet.public_subnets](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/subnet) | resource |
| [tencentcloud_subnet.stateful_subnets](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/subnet) | resource |
| [tencentcloud_subnet.utility_subnets](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/subnet) | resource |
| [tencentcloud_vpc.vpc](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_nat_ip_count"></a> [application\_nat\_ip\_count](#input\_application\_nat\_ip\_count) | Number of application NAT IPs | `number` | n/a | yes |
| <a name="input_application_subnets"></a> [application\_subnets](#input\_application\_subnets) | List of application subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>    name             = string<br>  }))</pre> | n/a | yes |
| <a name="input_compliance_subnets"></a> [compliance\_subnets](#input\_compliance\_subnets) | List of compliance subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>    name             = string<br>  }))</pre> | n/a | yes |
| <a name="input_general_nat_ip_count"></a> [general\_nat\_ip\_count](#input\_general\_nat\_ip\_count) | Number of general NAT IPs | `number` | n/a | yes |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | Enviroment label | `string` | n/a | yes |
| <a name="input_label_team"></a> [label\_team](#input\_label\_team) | Team label | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>    name             = string<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of VPC | `string` | n/a | yes |
| <a name="input_reserved_nat_ip"></a> [reserved\_nat\_ip](#input\_reserved\_nat\_ip) | Number of reserved NAT IPs | `number` | n/a | yes |
| <a name="input_stateful_subnets"></a> [stateful\_subnets](#input\_stateful\_subnets) | List of stateful subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>    name             = string<br>  }))</pre> | n/a | yes |
| <a name="input_utility_subnets"></a> [utility\_subnets](#input\_utility\_subnets) | List of utility subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>    name             = string<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_application_addresses"></a> [nat\_application\_addresses](#output\_nat\_application\_addresses) | NAT application addresses |
| <a name="output_nat_general_addresses"></a> [nat\_general\_addresses](#output\_nat\_general\_addresses) | NAT general addresses |
| <a name="output_nat_reserved_addresses"></a> [nat\_reserved\_addresses](#output\_nat\_reserved\_addresses) | NAT reserved addresses |
| <a name="output_private_dns_name"></a> [private\_dns\_name](#output\_private\_dns\_name) | private DNS name |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | VPC name |
