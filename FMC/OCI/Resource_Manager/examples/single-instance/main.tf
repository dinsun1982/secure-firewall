module "fmc-1" {
  source                      = "../../"
  network_strategy            = var.network_strategy
  subnet_id                   = var.subnet_id
  num_instances               = var.num_instances
  multiple_ad                 = var.multiple_ad
  user_ocid                   = var.user_ocid
  fingerprint                 = var.fingerprint
  tenancy_ocid                = var.tenancy_ocid
  private_key_path            = var.private_key_path
  region                      = var.region
  compartment_id              = var.compartment_id
  mangement_vcn_display_name  = var.mangement_vcn_display_name
  mangement_vcn_cidr_block    = var.mangement_vcn_cidr_block
  mangement_subnet_cidr_block = var.mangement_subnet_cidr_block
  label_prefix                = var.label_prefix
  vm_compute_shape            = var.vm_compute_shape
  admin_password              = var.admin_password
  admin_ssh_pub_key           = var.admin_ssh_pub_key
  day_0_config                = var.day_0_config
  hostname                    = var.hostname
  appliance_ips               = var.appliance_ips
}