output "mgmt_interface" {
  value =azurerm_network_interface.fmcv-mgmt.*.id
}

output "outside_interface" {
  value = azurerm_network_interface.fmcv-outside.*.id
}

output "outside_interface_ip_address" {
  value = azurerm_network_interface.fmcv-outside.*.private_ip_address
}


output "inside_interface" {
  value =azurerm_network_interface.fmcv-inside.*.id
}

output "inside_interface_ip_address" {
  value =azurerm_network_interface.fmcv-inside.*.private_ip_address
}

output "diag_interface" {
  value =azurerm_network_interface.fmcv-diagnostic.*.id
}


output "inside_subnet" {
  value = azurerm_subnet.subnets["inside"].id
 
}

output "inside_subnet_cidr" {
  value = azurerm_subnet.subnets["inside"].address_prefixes
 
}

output "outside_subnet" {
  value = azurerm_subnet.subnets["outside"].id
 
}

output "outside_subnet_cidr" {
  value = azurerm_subnet.subnets["outside"].address_prefixes
 
}


output "virtual_network_id" {
  value = azurerm_virtual_network.fmcv.*.id
}

