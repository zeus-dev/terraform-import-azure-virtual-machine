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
  name     = "tf"
  location = "centralindia"
}

# Import the virtual machine
resource "azurerm_virtual_machine" "imported" {
  name                = "terraform-machine"
  location            = azurerm_resource_group.imported.location
  resource_group_name = azurerm_resource_group.imported.name
  vm_size = "Standard_D2s_v3"

  network_interface_ids = [
    "/subscriptions/16a1a756-aaf0-4c8b-9e40-00000000000/resourceGroups/tf/providers/Microsoft.Network/networkInterfaces/terraform-machine287"
  ]

  os_profile {
    computer_name  = "terraform-machine"
    admin_username = "ganesh"
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



