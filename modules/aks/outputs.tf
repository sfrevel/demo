# Output variables for Resource Group module

output "resource_name" {
  value       = azurerm_resource_group.resource_group.name
  description = "Output name of the created Resource Group"
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

# output "host" {
#   value = azurerm_kubernetes_cluster.aks.kube_config.0.host
# }

# output "client_key" {
#   value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks.kube_config_raw
# }

# output "cluster_username" {
#   value = azurerm_kubernetes_cluster.aks.kube_config.0.username
# }

# output "cluster_password" {
#   value = azurerm_kubernetes_cluster.aks.kube_config.0.password
# }
