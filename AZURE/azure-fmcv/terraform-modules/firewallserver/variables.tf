variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  type    = string
  description = "Spacified location vNet."
 }

variable "prefix" {
  default     = "cisco-fmcv"
  type        = string
  description = "Prefix to prepend resource names"
}

variable "instances" {
  description = "Number of fmcv instances"
  type    = string
  default = ""
}

variable "image_version" {
  //default     = "70094.0.0"
  default     = "73069.0.0"
  type    = string
  description = "Version of the fmcv"
}


variable "vm_size" {
  default = "Standard_D3_v2"
  type    = string
  description = "Spacify VM size"
}
variable "RGName" {
  default = "cisco-fmcv-RG"
  type    = string
}
variable "instancename" {
  type    = string
  default = "FMCV01"
  description = "Spacify instance name"
}
variable "username" {
  type    = string
  default = "cisco"
  description = "Spacify username of fmcv server"
}
variable "password" {
  type    = string
  default = "P@$$w0rd1234"
  description = "Spacify username of fmcv server"
  sensitive = true
}

variable "azs" {
  type    = list
  default = [
    "1",
    "2",
    "3"
  ]
  
  description = "Azure Availability Zones"
}
variable "fmcv-interface-management" {
  type = list
  description = "fmcv interface management"
  default = []
}
variable "fmcv-interface-diagnostic" {
  type = list
  description = "fmcv interface diagnostic"
  default = []
}
variable "fmcv-interface-outside" {
  type = list
  description = "fmcv interface outside"
  default = []
}
variable "fmcv-interface-inside" {
  type = list
  description = "fmcv interface inside"
  default = []
}

