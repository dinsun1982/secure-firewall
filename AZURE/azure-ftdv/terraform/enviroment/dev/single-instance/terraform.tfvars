
#---------------------------Subcription Values---------------------------#
subscription_id = ""
tenant_id       = ""
client_id       = ""
client_secret   = ""

#-------------------RG Values--------------------------#
rg_name    = "cisco-ftdv-RG"
location   = "westeurope"
#-------------------Vnet Values--------------------------#
instances   = 1
azs         = ["1", "2", "3"]
vn_cidr     = "10.0.0.0/16"
subnet_size = "24"
  
#------------------Firewall values-------------------------------#

image_version             = "67065.0.0"
vm_size                   = "Standard_D3_v2"
instancename              = "cisco-ftdv"
username                  = "cisco"
password                  = "P@$$w0rd1234"
