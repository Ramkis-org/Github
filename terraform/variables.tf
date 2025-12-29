variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "sre-demo-rg"
}

variable "aks_name" {
  type    = string
  default = "sre-demo-aks"
}

variable "acr_name" {
  type    = string
  default = "srelloydsacr123"
}
