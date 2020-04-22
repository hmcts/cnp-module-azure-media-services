variable "location" {
  description = "The azure resource location"
}

variable "env" {
  description = "The platform environment"
}

variable "common_tags" {
  description = "Tags for the Azure resources"
}

variable "product" {
  description = "Product name used in naming standards"
}

variable "account_tier" {
  default     = "Standard"
  description = "Account Tier for the Azure Media Services instance. Defaults to Standard"
}

variable "account_replication_type" {
  default     = "LRS"
  description = "Account Replication Type for the Azure Media Services instance. Defaults to Locally Redundant"
}

variable "enabled" {
  default     = true
  type        = bool
  description = "Feature toggle flag to enable/disable the module in certain circumstances"
}
