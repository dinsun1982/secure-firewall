output "vm_ids" {
  description = "Virtual machine ids created."
  value       = azurerm_virtual_machine.asav-instance.*.id
}