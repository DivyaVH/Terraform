resource "azurerm_resource_group" "MyTerraformGroup"{
  name=var.resourceGroupName
  location= var.location
 tags=var.tags
}
