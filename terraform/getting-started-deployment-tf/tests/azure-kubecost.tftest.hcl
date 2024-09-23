# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 7

variables {
  deploy-azure = true
  deploy-azure-kubecost = true
  db_password = "test_password"
  auth_token = "test_token"
  azure-cloud-account-name = "test-account"
  azure-region             = "test-region"
  azure_subscription_id    = "test-azure-subscription-id"
  azure_resource_group     = "test-azure-resource-group"
}

mock_provider "spectrocloud" {
}

run "verify_azure_kubecost" {

  command = plan

  assert {
        condition     = length(spectrocloud_cluster_profile.azure-profile) == 1
        error_message = "No Azure cluster profile was created"
    }

  assert {
        condition     = length(spectrocloud_cluster_profile.azure-profile-kubecost) == 1
        error_message = "No Azure cluster profile with Kubecost was created"
    }

  assert {
        condition     = length(spectrocloud_cluster_azure.azure-cluster) == 1
        error_message = "No Azure cluster was created"
    }
}