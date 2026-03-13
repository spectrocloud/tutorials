variables {
  palette-project          = "Default"
  app_port                 = 8080
  deploy-aws               = false
  deploy-azure             = true
  azure-use-azs            = false
  azure-cloud-account-name = "test-account"
  azure_subscription_id    = "test-subscription-id"
  azure_resource_group     = "test-resource-group"
  azure-region             = "eastus"
}

mock_provider "spectrocloud" {
}

mock_provider "tls" {
}

run "verify_azure" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.azure_profile) == 1
    error_message = "No Azure cluster profile was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_config_template.azure_template) == 1
    error_message = "No Azure cluster template was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_azure.dev_cluster) == 1
    error_message = "No Azure cluster was created"
  }

  assert {
    condition     = spectrocloud_cluster_azure.dev_cluster[0].cluster_timezone == "UTC"
    error_message = "Azure cluster timezone is not set to UTC"
  }

  assert {
    condition     = length(tls_private_key.tutorial_ssh_key_azure) == 1
    error_message = "No Azure SSH key was created"
  }

}
