# Skaylink Terraform module; virtual network

### Example of `vnet_subnet_range`
```terraform
vnet_subnet_range = {
  # Subnet without service_delegation
  "backend-subnet" = {
    "ip_range"                        = "10.10.10.0/24"
    "attach_nsg"                      = true
    "service_endpoints"               = null
    "apply_service_endpoint_policies" = true
    "apply_service_link_policies"     = false
    "service_delegation"              = null
    "service_delegation_actions"      = []
  }
  # Subnet with service_delegation
  "databricks-host-subnet" = {
    "ip_range"                        = "10.10.11.0/24"
    "attach_nsg"                      = true
    "service_endpoints"               = null
    "apply_service_endpoint_policies" = false
    "apply_service_link_policies"     = false
    "service_delegation"              = "Microsoft.Databricks/workspaces",
    "service_delegation_actions"      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action", ]
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_security_group.internet_out](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.linux_customer_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.on_prem_out](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.quarantine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.web_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_application_security_group.windows_customer_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_network_security_group.vnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.allow_icmp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.allow_icmp_in](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.azure_services_outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.deny_all_in](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.deny_all_out](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.http_https_port_in_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.internet_outbound_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.mssql_port_in_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.on_prem_outbound_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.quarantine_inbound_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.quarantine_outbound_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.rdp_in_customer_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.ssh_in_customer_new_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.ssh_rdp_in_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.rt_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.vnet_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers to be configured for the virtual network (will be added along with the Azure Magic IP) | `list(string)` | n/a | yes |
| <a name="input_management_ip_range"></a> [management\_ip\_range](#input\_management\_ip\_range) | The IP range of the IQ3 management virtual network | `string` | n/a | yes |
| <a name="input_routetable_resource_id"></a> [routetable\_resource\_id](#input\_routetable\_resource\_id) | Resource Id of the route table to be attached to the subnets | `string` | `""` | no |
| <a name="input_rule_default_prefix"></a> [rule\_default\_prefix](#input\_rule\_default\_prefix) | The prefix to add to the NSG and ASG rules | `string` | `"iq3"` | no |
| <a name="input_virtual_network_tags"></a> [virtual\_network\_tags](#input\_virtual\_network\_tags) | Tags to be applied to the virtual network | `map(any)` | `null` | no |
| <a name="input_vnet_ip_range"></a> [vnet\_ip\_range](#input\_vnet\_ip\_range) | The IP range of the whole Virtual Network | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network | `string` | n/a | yes |
| <a name="input_vnet_resourcegroup"></a> [vnet\_resourcegroup](#input\_vnet\_resourcegroup) | The resource group where the virtual network and network security group will be located | `string` | n/a | yes |
| <a name="input_vnet_subnet_ranges"></a> [vnet\_subnet\_ranges](#input\_vnet\_subnet\_ranges) | A map of subnet names and their ranges (key: Subnet Name, Value: Subnet Range). For examples reference the README | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_internet_out"></a> [asg\_internet\_out](#output\_asg\_internet\_out) | n/a |
| <a name="output_asg_linux_customer_access"></a> [asg\_linux\_customer\_access](#output\_asg\_linux\_customer\_access) | n/a |
| <a name="output_asg_on_prem_out"></a> [asg\_on\_prem\_out](#output\_asg\_on\_prem\_out) | n/a |
| <a name="output_asg_quarantine"></a> [asg\_quarantine](#output\_asg\_quarantine) | n/a |
| <a name="output_asg_sql_server"></a> [asg\_sql\_server](#output\_asg\_sql\_server) | n/a |
| <a name="output_asg_web_server"></a> [asg\_web\_server](#output\_asg\_web\_server) | n/a |
| <a name="output_asg_windows_customer_access"></a> [asg\_windows\_customer\_access](#output\_asg\_windows\_customer\_access) | n/a |
| <a name="output_nsg"></a> [nsg](#output\_nsg) | n/a |
| <a name="output_nsg_association"></a> [nsg\_association](#output\_nsg\_association) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | n/a |
<!-- END_TF_DOCS -->