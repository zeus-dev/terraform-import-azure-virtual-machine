variable "location" {
  description = "Azure region location"
  default     = "centralindia"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "terraform-machine"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "tf"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  default     = "ganesh"
}

variable "network_interface_id" {
  description = "Network interface ID for the virtual machine"
  default     = "/subscriptions/16a1a756-aaf0-4c8b-9e40-000000000000/resourceGroups/tf/providers/Microsoft.Network/networkInterfaces/terraform-machine287"
}
