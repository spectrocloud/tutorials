# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 6

variables {
  deploy-azure             = true
  db_password              = "test_password"
  auth_token               = "test_token"
  azure-cloud-account-name = "test-account"
  azure-region             = "test-region"
  azure_subscription_id    = "test-azure-subscription-id"
  azure_resource_group     = "test-azure-resource-group"
}

mock_provider "spectrocloud" {
}

run "verify_azure" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.azure-profile) == 1
    error_message = "No Azure cluster profile was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_azure.azure-cluster) == 1
    error_message = "No Azure cluster was created"
  }

  assert {
    condition     = length(tls_private_key.tutorial_ssh_key_azure) == 1
    error_message = "No Azure SSH key was created"
  }

}
