# Input variables for resource group module

variable "project_name" {
  type        = string
  description = "The project name used"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Tags which should be assigned to the resource group"
}

variable "location" {
  type        = string
  description = "The azure region where the resource group should exist"
}

variable "rg_name" {
  type        = string
  description = "The name which should be used for this resource group."
}

variable "aks_name" {
  type        = string
  description = "The name which should be used for this aks cluster."
}

variable "aks_node_count" {
  type        = number
  default     = 2
  description = "The number of nodes which should be used for this aks cluster."
}

variable "appId" {
  type        = string
  sensitive   = true
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "Azure Kubernetes Service Cluster password"
}

