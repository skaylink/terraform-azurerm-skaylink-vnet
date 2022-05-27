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