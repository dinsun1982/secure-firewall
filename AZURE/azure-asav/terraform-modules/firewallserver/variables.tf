variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  type    = string
  description = "Spacified location vNet."
 }

variable "prefix" {
  default     = "cisco-asav"
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
variable "asav-interface-management" {
  type = list
  description = "asav interface management"
  default = []
}
variable "asav-interface-diagnostic" {
  type = list
  description = "asav interface diagnostic"
  default = []
}
variable "asav-interface-outside" {
  type = list
  description = "asav interface outside"
  default = []
}
variable "asav-interface-inside" {
  type = list
  description = "asav interface inside"
  default = []
}

variable "day-0-config" {
  default = "ASA_Running_Config.txt"
}