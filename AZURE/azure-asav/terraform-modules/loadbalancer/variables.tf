variable "instances" {
  description = "Number of asav instances"
  type = number
}

variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  type    = string
  description = "Spacified location of LB."
 }

variable "subnet_id" {
  description = "Spacified private subnet."
 }

variable "get_private_ip_address" {
  description = "private address"
  type        = string
}

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

variable "chain_gwlb_id" {
  description = "Chain load balancer frontend to the gateway load balancer"
}