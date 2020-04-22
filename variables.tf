variable "location" {
  description = "The azure resource location"
}

variable "env" {
  description = "The platform environment"
}

variable "tags" {
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
