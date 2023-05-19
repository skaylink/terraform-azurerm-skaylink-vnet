# ################
# # Bastion host #
# ################

resource "azurerm_subnet" "bastion_snt" {
  count                = var.bastion_subnet_range != null ? 1 : 0
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.bastion_subnet_range]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_public_ip" "bastion_ip" {
  count               = var.bastion_subnet_range != null ? 1 : 0
  name                = "${local.bastion_name}-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = local.bastion_name
}

resource "azurerm_bastion_host" "bastion_host" {
  count               = var.bastion_subnet_range != null ? 1 : 0
  name                = local.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    public_ip_address_id = azurerm_public_ip.bastion_ip[0].id
    subnet_id            = azurerm_subnet.bastion_snt[0].id
  }
}
