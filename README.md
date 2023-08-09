**how to import azure virtual machine**

use this command to get all details about ur machine

`az vm show --resource-group tf --name terraform-machine --show-details`


modify main.tf file for your names and machine type and resource names etc....


`terraform init`

`terraform import azurerm_resource_group.imported /subscriptions/16a1a756-aaf0-4c8b-9e40-000000000000/resourceGroups/tf`

`terraform import azurerm_virtual_machine.imported /subscriptions/16a1a756-aaf0-4c8b-9e40-000000000000/resourceGroups/tf/providers/Microsoft.Compute/virtualMachines/terraform-machine`

`terraform plan`

`terraform apply`

