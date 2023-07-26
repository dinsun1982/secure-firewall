data "azurerm_virtual_network" "asav" {
  count               = var.create_vn ? 0 : 1
  name                = local.vn_name
  resource_group_name = var.rg_name
}

