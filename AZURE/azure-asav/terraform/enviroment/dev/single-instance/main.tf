#--------------------------Resource Group--------------------------------#
module "rg" {
  source   = "../../../../terraform-modules/rg"
  rg_name  = var.rg_name
  location = var.location

}

#--------------------------Network--------------------------------#
module "network" {
  source      = "../../../../terraform-modules/network"
  rg_name     = module.rg.resource_group_name[0]
  location    = module.rg.location[0]
  instances   = var.instances
  azs         = var.azs
  vn_cidr     = var.vn_cidr
  subnet_size = var.subnet_size
  depends_on  = [module.rg]
}

# # # #--------------------------Firewall--------------------------------#
module "server" {
  source                    = "../../../../terraform-modules/firewallserver"
  rg_name                   = module.rg.resource_group_name[0]
  location                  = module.rg.location[0]
  image_version             = var.image_version
  vm_size                   = var.vm_size
  instancename              = var.instancename
  username                  = var.username
  password                  = var.password
  instances                 = var.instances
  azs                       = var.azs
  asav-interface-management = [module.network.mgmt_interface[0]]
  asav-interface-diagnostic = [module.network.diag_interface[0]]
  asav-interface-outside    = [module.network.outside_interface[0]]
  asav-interface-inside     = [module.network.inside_interface[0]]
  depends_on                = [module.rg, module.network]

}






