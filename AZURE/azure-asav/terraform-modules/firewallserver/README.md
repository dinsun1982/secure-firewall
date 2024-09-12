<!-- BEGIN_TF_DOCS -->
# Create asav firewall Servers module

## Overview

Create Create asav firewall servers with spacified values

## Module Name
firewall

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="prefix"></a> [prefix](#prefix) |Prefix to prepend resource names| `string` |cisco-asav| yes |
| <a name="instances"></a> [instances](#instances) |Number of asav instances| `number` |`""`| yes |
| <a name="image_version"></a> [image_version](#image_version) |Version of the ASA | `string` |67065.0.0| yes |
| <a name="rg_name"></a> [resource group name](#rg_name) |Azure Resource Group | `string` |`""`| yes |
| <a name="location"></a> [location](#location) |Spacify location | `string` |`""`| yes|
| <a name="vm_size"></a> [vm_size](#vm_size) |Spacify VM size | `string` |Standard_D3_v2| yes |
| <a name="instancename"></a> [instancename](#instancename) |Spacify instance name | `string` | ASA01 | yes|
| <a name="username"></a> [username](#username) |Spacify username of asav server | `string` | cisco | yes|
| <a name="password"></a> [password](#password) |Spacify password of asav server | `string` | `""` | yes|
| <a name="azs"></a> [azs"](#azs") |Azure Availability Zones | `list` | [1,2,3] | yes|
| <a name="asav-interface-management"></a> [asav-interface-management](#asav-interface-management) |asav-interface-management | `list` | `""` | yes|
| <a name="asav-interface-diagnostic"></a> [asav-interface-diagnostic](#asav-interface-diagnostic) |asav-interface-diagnostic | `list` | `""` | yes|
| <a name="asav-interface-outside"></a> [asav-interface-outside](#asav-interface-outside) |asav-interface-outside | `list` | `""` | yes|
| <a name="asav-interface-inside"></a> [asav-interface-inside](#asav-interface-inside) |asav-interface-inside | `list` | `""` | yes|

<!-- END_TF_DOCS -->