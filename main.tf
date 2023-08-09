terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Import the resource group
resource "azurerm_resource_group" "imported" {
  name     = var.resource_group_name
  location = var.location
}

# Import the virtual machine
resource "azurerm_virtual_machine" "imported" {
  name                = var.vm_name
  location            = azurerm_resource_group.imported.location
  resource_group_name = azurerm_resource_group.imported.name
  vm_size             = var.vm_size

  network_interface_ids = [var.network_interface_id]

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = false
    # provision_vm_agent              = true
  }

  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "terraform-machine_disk1_b33d5b2990a64aae81780b75e4d0660e"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  tags = {
    name = "tf"
  }
}
