# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 6

variables {
  deploy-azure             = true
  deploy-azure-var         = true
  azure-cloud-account-name = "REPLACE ME"
  azure-region             = "REPLACE ME"
  azure_subscription_id    = "REPLACE ME"
  azure_resource_group     = "REPLACE ME"
}

mock_provider "spectrocloud" {}

run "verify_azure_replace" {

  command = plan

  expect_failures = [
    var.azure-cloud-account-name,
    var.azure-region,
    var.azure_subscription_id,
    var.azure_resource_group
  ]

}
