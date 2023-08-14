
################################################################################################
### Network variables
################################################################################################

variable "rg_name" {
  type        = string
  description = "Azure Resource Group"
  
}

variable "location" {
  description = "Geographic region resource will be deployed into"
  type        = string
 
}

variable "create_vn" {
  default     = true
  type        = string
  description = "Wheather to create Virtual Network"
}

variable "vn_name" {
  type        = string
  default     = ""
  description = "Existing Virtual Network Name"
}

variable "vn_cidr" {
  type        = string
  description = "Virtual Network CIDR"
}

variable "subnets" {
  default = []
  description = "subnets for ASA interfaces"
}


variable "subnet_size" {
  type        = string
  description = "Size of Subnets"
}

variable "instances" {
  description = "Number of fmcv instances"
}

variable "azs" {
  default = []
  description = "Azure Availability Zones"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default = {
    ENV = "Dev"
  }
}
variable "prefix" {
  default     = "cisco-fmcv"
  description = "Prefix to prepend resource names"
}
