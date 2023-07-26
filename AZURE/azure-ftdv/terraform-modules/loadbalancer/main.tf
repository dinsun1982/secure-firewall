# ################################################################################################################################
# # External LB Creation
# ################################################################################################################################

resource "azurerm_public_ip" "ELB-PublicIP" {
  count               = var.instances > 1 ? 1 : 0
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "ftd-elb" {
  count               = var.instances > 1 ? 1 : 0
  name                = "FTD-ELB"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "ExternalIPAddress"
    public_ip_address_id = azurerm_public_ip.ELB-PublicIP[0].id
    gateway_load_balancer_frontend_ip_configuration_id  = var.chain_gwlb_id[count.index].id
  }
}

resource "azurerm_lb_backend_address_pool" "ELB-Backend-Pool" {
  count           = var.instances > 1 ? 1 : 0
  loadbalancer_id = azurerm_lb.ftd-elb[0].id
  name            = "BackEndAddressPool"
}

                       
resource "azurerm_lb_probe" "FTD-ELB-Probe" {
  count               = var.instances > 1 ? 1 : 0
  loadbalancer_id     = azurerm_lb.ftd-elb[0].id
  name                = "ssh-running-probe"
  port                = 22
}

resource "azurerm_lb_rule" "elbrule" {
  count                          = var.instances > 1 ? 1 : 0
  loadbalancer_id                = azurerm_lb.ftd-elb[0].id
  name                           = "ELBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "ExternalIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.ELB-Backend-Pool[0].id]
  probe_id                       = azurerm_lb_probe.FTD-ELB-Probe[0].id
}
