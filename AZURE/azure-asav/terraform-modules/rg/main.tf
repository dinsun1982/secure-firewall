################################################################################################################################
# Resource Group Creation
################################################################################################################################

resource "azurerm_resource_group" "asav" {
  count    = var.create_rg ? 1 : 0
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}
