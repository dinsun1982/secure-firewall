
# ################################################################################################################################
# # External LB Creation
# ################################################################################################################################

resource "azurerm_public_ip" "ELB-PublicIP" {
  count               = var.instances > 1 ? 1 : 0
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.PIP_allocation_method
  sku                 = var.PIP_sku #"Standard"
}

resource "azurerm_lb" "asav-elb" {
  count               = var.instances > 1 ? 1 : 0
  name                = "asav-elb"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = "ExternalIPAddress"
    public_ip_address_id = azurerm_public_ip.ELB-PublicIP[0].id
    gateway_load_balancer_frontend_ip_configuration_id  = var.chain_gwlb_id[count.index].id
   }
}

resource "azurerm_lb_backend_address_pool" "ELB-Backend-Pool" {
  count           = var.instances > 1 ? 1 : 0
  loadbalancer_id = azurerm_lb.asav-elb[0].id
  name            = "BackEndAddressPool"
}
                 

resource "azurerm_lb_probe" "asav-elb-Probe" {
  count               = var.instances > 1 ? 1 : 0
  loadbalancer_id     = azurerm_lb.asav-elb[0].id
  name                = "ssh-running-probe"
  port                = 22
}

resource "azurerm_lb_rule" "elbrule" {
  count                          = var.instances > 1 ? 1 : 0
  loadbalancer_id                = azurerm_lb.asav-elb[0].id
  name                           = "ELBRule"
  protocol                       = var.lb_rule_protocol_type
  frontend_port                  = var.lb_rule_frontend_port
  backend_port                   = var.lb_rule_backend_port
  frontend_ip_configuration_name = "ExternalIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.ELB-Backend-Pool[0].id]
  probe_id                       = azurerm_lb_probe.asav-elb-Probe[0].id
}
