
#---------------------------Subcription Values---------------------------#
subscription_id = "de8d8e4e-424e-4607-9c38-6fef19c338e6"
tenant_id       = "2b4f57bf-d8e9-41ce-81b9-d8d858a0b7ba"
client_id       = "e6525abc-53b8-42bb-8c32-8e2d29975ce0"
client_secret   = "a328Q~BdU7jXvZ1MF3-qs4ev8CMDPJ4a8tT6cb2I"

#-------------------RG Values--------------------------#
rg_name    = "cisco-asav-RG"
location   = "westeurope"
#-------------------Vnet Values--------------------------#
instances   = 2
azs         = ["1", "2", "3"]
vn_cidr     = "10.0.0.0/16"
subnet_size = "24"

#------------------Firewall values-------------------------------#

image_version             = "915117.0.0"
vm_size                   = "Standard_D3_v2"
instancename              = "cisco-asav"
username                  = "cisco"
password                  = "P@$$w0rd1234"

#------------------LoadBalancer values-------------------------------#

PIP_allocation_method        = "Static"
PIP_sku                      = "Standard"
lb_sku                       = "Standard"
lb_rule_protocol_type        = "Tcp"
lb_rule_frontend_port        = "80"
lb_rule_backend_port         = "80"

