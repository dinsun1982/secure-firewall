<!-- BEGIN_TF_DOCS -->
# Create Network module

## Overview

Create Network resource like Vnet, subnet, network interface card, network security group,routetable,public ip

## Module Name
network

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="create_vn"></a> [create_vn](#create_vn) |Wheather to create Virtual Network| `boolean` |`""`| yes |
| <a name="vn_name"></a> [vnet name](#vn_name) |  Existing Virtual Network Name | `string` |`""`| yes |
| <a name="rg_name"></a> [resource group name](#rg_name) |Azure Resource Group | `string` |`""`| yes |
| <a name="location"></a> [location](#location) |Spacify location | `string` |`""`| yes|
| <a name="vn_cidr"></a> [vnet cidr](#vn_cidr) | Virtual Network CIDR | `string` |10.0.0.0/16| yes |
| <a name="tags"></a> [tags](#tags) |Spacify tags name for the resources | `map(string)` | `""` | yes|
| <a name="subnet list"></a> [subnet_lists](#subnet_lists) |Add list of subnet list  | `list` | `""` | yes|
| <a name="address prefixes"></a> [address_prefixes](#address_prefixes) |spacify address prefixes of subnets | `list` | `""` | yes|
| <a name="network security group"></a> [NSG](#NSG) |spacify NGS inbound and outbond rule | `string` | `""` | yes|
| <a name="route table"></a> [routetable](#routetable) |add routetable associate with subnets | `string` | `""` | yes|
| <a name="network interface"></a> [network interface](#networkinterface) |network interface attached with subnets | `list` | `""` | yes|



<!-- END_TF_DOCS -->