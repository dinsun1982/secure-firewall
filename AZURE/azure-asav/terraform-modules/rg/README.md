<!-- BEGIN_TF_DOCS -->
# Create Resouce Group module

## Overview

Create Resouce Group to manage the resources and create resources under the same resource group

## Module Name
resource group (rg)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="create_rg"></a> [create_rg](#create_rg) | create resource group| `boolean` |`""`| yes |
| <a name="rg_name"></a> [resource group name](#rg_name) | Specify resource group name | `string` |`""`| yes |
| <a name="location"></a> [location](#location) |Spacify location | `string` |`""`| yes|
| <a name="tags"></a> [tags](#tags) |Spacify tags name for the resources | `map(string)` | dev | yes|

<!-- END_TF_DOCS -->