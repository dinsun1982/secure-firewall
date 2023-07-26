<!-- BEGIN_TF_DOCS -->
# Create Gateway LoadBalancer module

## Overview

Create Gateway LoadBalancer and on chaining External LB to Gateway LoadBalancer
 

## Module Name
gwlb

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="instances"></a> [instances](#instances) |Number of instances| `number` |`2`| yes |
| <a name="sku"></a> [sku](#sku) |type of sku| `string` |`Gatway`| yes |
| <a name="vn_name"></a> [vnet name](#vn_name) |  Existing Virtual Network Name | `string` |`""`| yes |
| <a name="rg_name"></a> [resource group name](#rg_name) |Azure Resource Group | `string` |`""`| yes |
| <a name="location"></a> [location](#location) |Spacify location | `string` |`""`| yes|
| <a name="subnet_id"></a> [subnet_id](#subnet_id) | spacified subnet id | `string` |`""`| yes |
| <a name="private_ip_address_ext"></a> [private_ip_address_ext](#private_ip_address_ext) | External Private ip address to assign to frontend. Use it with type = private | `list` | `""` | yes|
| <a name="virtual_network_id"></a> [virtual_network_id"](#virtual_network_id") |Spacified Vnet ID | `string` | `""` | yes|
| <a name="get_private_ip_address"></a> [get_private_ip_address](#get_private_ip_address) |get_private_ip_address | `string` | `""` | yes|

## Backend Adrress pool

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



<!-- END_TF_DOCS -->