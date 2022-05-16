# terraform-azure-myfirstmodule
# module usage
module "storageaccount" {
  source = "../AnjiMuduthanapally/terraform-azure-myfirstmodule/azurerm"
  assetname = "anji"
  environment = "dev"
  resource_group_location = "west europe"
  resource_group_name = "sa-rg"
  subscription_id = ""
  client_id = ""
  client_secret = ""
  tenant_id = ""
}
