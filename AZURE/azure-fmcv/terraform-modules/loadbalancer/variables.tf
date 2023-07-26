variable "instances" {
  description = "Number of fmcv instances"
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

variable "chain_gwlb_id" {
  description = "Chain load balancer frontend to the gateway load balancer"
}