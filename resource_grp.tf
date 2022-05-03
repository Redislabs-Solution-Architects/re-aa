
locals {
  location = var.resource_group_region
}

resource "azurerm_resource_group" "resource-grp-tf" {
  name     = var.resource_group_name
  location = local.location
  tags     = var.tags
}
