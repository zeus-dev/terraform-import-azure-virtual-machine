terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}
# provider "azurerm" {
#   features {}
#   }

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
    "/subscriptions/16a1a756-aaf0-4c8b-9e40-c890ecc0ef6e/resourceGroups/tf/providers/Microsoft.Network/networkInterfaces/terraform-machine287"
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

# # Import existing Azure VM and related resources
# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = ">=2.0"
#     }
#   }
# }

# Manually import the existing resources using 'terraform import' command





# resource "azurerm_resource_group" "tf" {
#   name     = "tf"
#   location = "Central india"
# }


# resource "azurerm_virtual_network" "main" {
#   name                = "terraform-machine-vnet/default"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.tf.location
#   resource_group_name = azurerm_resource_group.tf.name
# }

# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.tf.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_network_interface" "main" {
#   name                = "terraform-machine287"
#   location            = azurerm_resource_group.tf.location
#   resource_group_name = azurerm_resource_group.tf.name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }