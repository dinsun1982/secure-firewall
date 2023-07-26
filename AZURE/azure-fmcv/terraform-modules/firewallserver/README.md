<!-- BEGIN_TF_DOCS -->
# Create fmcv firewall Servers module

## Overview

Create Create fmcv firewall servers with spacified values

## Module Name
firewall

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="prefix"></a> [prefix](#prefix) |Prefix to prepend resource names| `string` |cisco-fmcv| yes |
| <a name="instances"></a> [instances](#instances) |Number of fmcv instances| `number` |`""`| yes |
| <a name="image_version"></a> [image_version](#image_version) |Version of the FTD | `string` |67065.0.0| yes |
| <a name="rg_name"></a> [resource group name](#rg_name) |Azure Resource Group | `string` |`""`| yes |
| <a name="location"></a> [location](#location) |Spacify location | `string` |`""`| yes|
| <a name="vm_size"></a> [vm_size](#vm_size) |Spacify VM size | `string` |Standard_D3_v2| yes |
| <a name="instancename"></a> [instancename](#instancename) |Spacify instance name | `string` | FTD01 | yes|
| <a name="username"></a> [username](#username) |Spacify username of fmcv server | `string` | cisco | yes|
| <a name="password"></a> [password](#password) |Spacify password of fmcv server | `string` | `""` | yes|
| <a name="azs"></a> [azs"](#azs") |Azure Availability Zones | `list` | [1,2,3] | yes|
| <a name="fmcv-interface-management"></a> [fmcv-interface-management](#fmcv-interface-management) |fmcv-interface-management | `list` | `""` | yes|
| <a name="fmcv-interface-diagnostic"></a> [fmcv-interface-diagnostic](#fmcv-interface-diagnostic) |fmcv-interface-diagnostic | `list` | `""` | yes|
| <a name="fmcv-interface-outside"></a> [fmcv-interface-outside](#fmcv-interface-outside) |fmcv-interface-outside | `list` | `""` | yes|
| <a name="fmcv-interface-inside"></a> [fmcv-interface-inside](#fmcv-interface-inside) |fmcv-interface-inside | `list` | `""` | yes|

<!-- END_TF_DOCS -->