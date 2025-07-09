resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.key #each.value.vnet_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space



  # dynamic "subnet" {
  #   for_each = each.value.subnets != null ? each.value.subnets : {}
  #   content {
  #     name             = subnet.key
  #     address_prefixes = subnet.value.address_prefixes
  #   }
  # }

}

resource "azurerm_subnet" "subnets" {
  depends_on           = [azurerm_virtual_network.vnets]
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes

  # depends_on = [azurerm_virtual_network.vnets]
}