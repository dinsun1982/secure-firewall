
################################################################################################
### common variables
################################################################################################
variable "subscription_id" {
  description = "Azure subscription ID"
}

variable "tenant_id" {
  description = "Azure tentent ID"
}

variable "client_id" {
  description = "Azure clinet ID"
}

variable "client_secret" {
  description = "Azure secret ID"
}

variable "location" {
  description = "Geographic region resource will be deployed into"
  type        = string
 }

variable "instances" {
  description = "Number of asav instances"
}

variable "rg_name" {
  description = "Azure Resource Group"
}

variable "azs" {
  default = []
  description = "Azure Availability Zones"
}

################################################################################################
### Network variables
################################################################################################

variable "create_vn" {
  default     = true
  type        = string
  description = "Wheather to create Virtual Network"
}

variable "vn_cidr" {
  type        = string
  description = "Virtual Network CIDR"
}

variable "subnet_size" {
  type        = string
  description = "Size of Subnets"
}

################################################################################################
### VM variables
################################################################################################

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


################################################################################################
### Load Balancer Variables
################################################################################################

variable "PIP_allocation_method" {
  description = "puclic IP allocation method"
  type        = string
}

variable "PIP_sku" {
  description = "puclic IP SKU"
  type        = string
}
variable "lb_sku" {
  description = "loadbalancer SKU"
  type        = string
}

variable "lb_rule_protocol_type" {
  description = "loadbalancer rule protocol type"
  type        = string
}

variable "lb_rule_frontend_port" {
  description = "loadbalancer rule frontend port"
  type        = string
}

variable "lb_rule_backend_port" {
  description = "loadbalancer rule backend port"
  type        = string
}

