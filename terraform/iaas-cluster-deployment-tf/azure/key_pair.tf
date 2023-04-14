resource "azurerm_ssh_public_key" "tutorial-key" {
  name                = var.ssh_key_name
  resource_group_name = var.resource_group
  location            = var.region
  public_key          = var.ssh_public_key
}