################################################################################################################################
# fmcv Instance Creation
################################################################################################################################

resource "azurerm_virtual_machine" "fmcv-instance" {
  name                = "${var.prefix}-vm%{if var.instances > 1}-${count.index}%{endif}"
  count               = var.instances
  location            = var.location
  resource_group_name = var.rg_name

  primary_network_interface_id = element(var.fmcv-interface-management,count.index)
  network_interface_ids = [element(var.fmcv-interface-management,count.index),
                           element(var.fmcv-interface-diagnostic,count.index),
                           element(var.fmcv-interface-outside,count.index),
                           element(var.fmcv-interface-inside,count.index)
                           ]
  vm_size = var.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  plan {
    name      = "fmcv-azure-byol"
    publisher = "cisco"
    product   = "cisco-fmcv"
  }

  storage_image_reference {
    publisher = "cisco"
    offer     = "cisco-fmcv"
    sku       = "fmcv-azure-byol"
    version   = var.image_version
  }
  storage_os_disk {
    name              = "${var.prefix}-myosdisk%{if var.instances > 1}-${count.index}%{endif}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.instancename}%{if var.instances > 1}${count.index}%{endif}"
    admin_username = var.username
    admin_password = var.password
    custom_data = base64encode(data.template_file.startup_file_fmc.rendered)
  }
  os_profile_linux_config {
    disable_password_authentication = false

  }
  zones = var.instances == 1 ? [] : [local.az_distribution[count.index]]
}

