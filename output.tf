output "vm_name" {
  value = azurerm_virtual_machine.imported.name
}

output "vm_location" {
  value = azurerm_virtual_machine.imported.location
}

output "vm_resource_group" {
  value = azurerm_virtual_machine.imported.resource_group_name
}

output "vm_size" {
  value = azurerm_virtual_machine.imported.vm_size
}

output "network_interface_ids" {
  value = azurerm_virtual_machine.imported.network_interface_ids
}
