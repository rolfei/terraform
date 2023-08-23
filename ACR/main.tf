resource "azurerm_resource_group" "res-0" {
  location = "uksouth"
  name     = "ACRResourceGroup"
}
resource "azurerm_container_registry" "res-1" {
  admin_enabled       = true
  location            = "uksouth"
  name                = "rolfeiacr"
  resource_group_name = "ACRResourceGroup"
  sku                 = "Basic"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_container_registry_scope_map" "res-2" {
  actions                 = ["repositories/*/metadata/read", "repositories/*/metadata/write", "repositories/*/content/read", "repositories/*/content/write", "repositories/*/content/delete"]
  container_registry_name = "rolfeiacr"
  description             = "Can perform all read, write and delete operations on the registry"
  name                    = "_repositories_admin"
  resource_group_name     = "ACRResourceGroup"
  depends_on = [
    azurerm_container_registry.res-1,
  ]
}
resource "azurerm_container_registry_scope_map" "res-3" {
  actions                 = ["repositories/*/content/read"]
  container_registry_name = "rolfeiacr"
  description             = "Can pull any repository of the registry"
  name                    = "_repositories_pull"
  resource_group_name     = "ACRResourceGroup"
  depends_on = [
    azurerm_container_registry.res-1,
  ]
}
resource "azurerm_container_registry_scope_map" "res-4" {
  actions                 = ["repositories/*/content/read", "repositories/*/content/write"]
  container_registry_name = "rolfeiacr"
  description             = "Can push to any repository of the registry"
  name                    = "_repositories_push"
  resource_group_name     = "ACRResourceGroup"
  depends_on = [
    azurerm_container_registry.res-1,
  ]
}
