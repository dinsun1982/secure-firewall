

################################################################################################
### VM variables
################################################################################################

variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  type    = string
  description = "Spacified location vNet."
 }

variable "prefix" {
  default     = "cisco-FTDv"
  type        = string
  description = "Prefix to prepend resource names"
}

variable "instances" {
  description = "Number of asav instances"
  type    = string
 }

variable "image_version" {
  type    = string
  description = "Version of the asav"
}

variable "vm_size" {
  type    = string
  description = "Spacify VM size"
}

variable "instancename" {
  type    = string
  description = "Spacify instance name"
}
variable "username" {
  type    = string
  description = "Spacify username of asav server"
}
variable "password" {
  type    = string
   description = "Spacify username of asav server"
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
variable "ftdv-interface-management" {
  type = list
  description = "ftdv interface management"
  default = []
}
variable "ftdv-interface-diagnostic" {
  type = list
  description = "ftdv interface diagnostic"
  default = []
}
variable "ftdv-interface-outside" {
  type = list
  description = "ftdv interface outside"
  default = []
}
variable "ftdv-interface-inside" {
  type = list
  description = "ftdv interface inside"
  default = []
}
