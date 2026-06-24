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
resource "azurerm_resource_group" "import_rg_created_from_azportal" {
  name     = "rg-import-demo"
  location = "East US"
}
resource "azurerm_storage_share" "fileshare" {
  name                 = "sharedfiles"
  storage_account_id = azurerm_storage_account.storage1.id
  quota                = 50
}

resource "azurerm_managed_disk" "disk" {
  name                 = "datadisk01"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128
}
