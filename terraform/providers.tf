provider "azurerm" {
  features {}

  # Use the Managed Identity of the Jenkins VM
  use_msi         = true

  # Keep your subscriptions variable if you want
  subscription_id = var.azure_subscription_id
}
