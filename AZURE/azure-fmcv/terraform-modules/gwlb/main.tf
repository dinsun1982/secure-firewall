
################################################################################################################################
# GWLB Creation
################################################################################################################################

resource "azurerm_lb" "gatewaylb" {
  count               = var.instances > 1 ? 1 : 0
  name                = "fmcv-gatewaylb"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Gateway"

  frontend_ip_configuration {
    name                          = "GatwayIPAddress"
    subnet_id                     = var.subnet_id
    private_ip_address            = cidrhost(var.get_private_ip_address, 100)
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_lb_backend_address_pool" "Gateway-LB-Backend-Pool" {
  count           = var.instances > 1 ? 1 : 0
  loadbalancer_id = azurerm_lb.gatewaylb[0].id
  name            = "GatewayBackEndAddressPool"
  tunnel_interface{
  identifier = 800
  type = "Internal"    #out (backend pool)
  protocol = "VXLAN"
  port = 10800
  }
  tunnel_interface{
    identifier = 801
    type = "External"     #in (backend pool)
    protocol = "VXLAN"
    port = 10801
  }
}

resource "azurerm_lb_backend_address_pool_address" "GatewayLB-Backend-Address" {
  count                   = var.instances > 1 ? var.instances : 0
  name                    = "GatewayLB-Backend-Address%{if var.instances > 1}-${count.index}%{endif}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.Gateway-LB-Backend-Pool[0].id
  virtual_network_id      = var.virtual_network_id
  ip_address              = element(var.private_ip_address_ext,count.index)
 
}

resource "azurerm_lb_probe" "Gateway-lb-Probe" {
  count               = var.instances > 1 ? 1 : 0
  //resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.gatewaylb[0].id
  name                = "gateway-ssh-running-probe"
  port                = 22
}

resource "azurerm_lb_rule" "Gateway-rule" {
  count                          = var.instances > 1 ? 1 : 0
  //resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.gatewaylb[0].id
  name                           = "GatewayLBRule"
  protocol                       = "All"
  frontend_port                  = 0
  backend_port                   = 0
  frontend_ip_configuration_name = "GatwayIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.Gateway-LB-Backend-Pool[0].id]
  probe_id                       = azurerm_lb_probe.Gateway-lb-Probe[0].id
}


