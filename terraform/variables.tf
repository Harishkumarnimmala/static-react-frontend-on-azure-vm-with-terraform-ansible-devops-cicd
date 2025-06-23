variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (App ID)"
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "resource_group_name" {
  type        = string
  default     = "react-devops-rg"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "North Europe"
  description = "Azure region"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

