# cnp-module-azure-media-services

Terraform module for [Azure Media Services](https://azure.microsoft.com/en-gb/services/media-services/).

Based on the [Native Terraform Module](https://www.terraform.io/docs/providers/azurerm/r/media_services_account.html).

## Inputs
### Required
* `location`: The azure resource location
* `env`: The platform environment
* `product`: Product name used in naming standards

### Optional
* `account_tier`: Account Tier for the Azure Media Services instance. Defaults to Standard
* `account_replication_type`: Account Replication Type for the Azure Media Services instance. Defaults to Locally Redundant

## Example Usage
```hcl-terraform
module "azure-media-services" {
  source = "git@github.com:hmcts/cnp-module-azure-media-services"
  location = "uksouth"
  env = "prod"
  product = "dm"
  account_tier = "Premium"
  account_replication_type = "GRS"
}
```

## Outputs
* `id`: The id of the Media Services Account

Media Services Accounts can be imported using the resource id, e.g.

```bash
terraform import azurerm_media_services_account.account /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Media/mediaservices/account1
```
