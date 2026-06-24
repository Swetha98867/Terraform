resource "azurerm_storage_share" "fileshare" {
  name                 = "sharedfiles"
  storage_account_id = azurerm_storage_account.storage1.id
  quota                = 50
}
