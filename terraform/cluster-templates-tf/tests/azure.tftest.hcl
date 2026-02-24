variables {
  palette-project = "Default"
  deploy-aws      = false
  deploy-azure    = true
}

mock_provider "spectrocloud" {
}

run "verify_azure_profile" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.azure_profile) == 1
    error_message = "No Azure cluster profile was created"
  }

}
