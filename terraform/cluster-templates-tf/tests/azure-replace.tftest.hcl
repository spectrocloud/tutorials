variables {
  palette-project          = "Default"
  app_port                 = 8080
  deploy-aws               = false
  deploy-azure             = true
  azure-use-azs            = false
  azure-cloud-account-name = "REPLACE ME"
  azure_subscription_id    = "REPLACE ME"
  azure_resource_group     = "REPLACE ME"
  azure-region             = "REPLACE ME"
}

mock_provider "spectrocloud" {}

mock_provider "tls" {}

run "verify_azure" {

  command = plan

  expect_failures = [
    var.azure-cloud-account-name,
    var.azure_subscription_id,
    var.azure_resource_group,
    var.azure-region,
  ]

}
