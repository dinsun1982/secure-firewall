#--------------------------Resource Group--------------------------------#
module "rg" {
  source        = "../../../../terraform-modules/rg"
  rg_name       = var.rg_name
  location      = var.location
}

#--------------------------Network--------------------------------#
module "network" {
  source                  = "../../../../terraform-modules/network"
  rg_name                 = module.rg.resource_group_name[0]
  location                = module.rg.location[0]
  instances               = var.instances
  depends_on              = [module.rg]
 }

# # #--------------------------Firewall--------------------------------#
 module "server" {
  source                       = "../../../../terraform-modules/firewallserver"
  rg_name                      = module.rg.resource_group_name[0]
  location                     = module.rg.location[0]
  instances                    = var.instances
  fmcv-interface-management    = [module.network.mgmt_interface[0],module.network.mgmt_interface[1]]
  fmcv-interface-diagnostic    = [module.network.diag_interface[0],module.network.diag_interface[1]]
  fmcv-interface-outside       = [module.network.outside_interface[0],module.network.outside_interface[1]]
  fmcv-interface-inside        = [module.network.inside_interface[0],module.network.inside_interface[1]]
  depends_on                   = [module.rg, module.network]
}

 module "lb" {
  source                       = "../../../../terraform-modules/loadbalancer"
  rg_name                      = module.rg.resource_group_name[0]
  location                     = module.rg.location[0]
  instances                    = var.instances
  subnet_id                    = module.network.inside_subnet
  get_private_ip_address       = module.network.inside_subnet_cidr[0]
  chain_gwlb_id                = module.gwlb.azurerm_lb_frontend_ip_configuration[0]
  depends_on                   = [module.rg, module.network,module.gwlb]
 }


 module "gwlb" {
  source                       = "../../../../terraform-modules/gwlb"
  rg_name                      = module.rg.resource_group_name[0]
  location                     = module.rg.location[0]
  instances                    = var.instances
  subnet_id                    = module.network.outside_subnet
  get_private_ip_address       = module.network.outside_subnet_cidr[0]
  private_ip_address_ext       = [module.network.outside_interface_ip_address[0],module.network.outside_interface_ip_address[1]]
  private_ip_address_int       = [module.network.inside_interface_ip_address[0],module.network.inside_interface_ip_address[1]]
  virtual_network_id           = module.network.virtual_network_id[0]
  depends_on                   = [module.rg, module.network]
 }


