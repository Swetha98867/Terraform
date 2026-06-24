resource "azurerm_resource_group" "rg" {
  name     = "rg-dev-eastus"
  location = "East US"
}

resource "azurerm_storage_account" "storage1" {
  name                     = "storageaccount456789"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
