data "spectrocloud_cloudaccount_aws" "aws" {
  name = var.aws-cloud-account-name
}

data "spectrocloud_cloudaccount_gcp" "gcp" {
  name = var.gcp-cloud-account-name
}

/*data "spectrocloud_cloudaccount_azure" "azure" {
  name = var.azure-cloud-account-name
}*/