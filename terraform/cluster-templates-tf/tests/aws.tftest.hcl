variables {
  palette-project = "Default"
  deploy-aws      = true
  deploy-azure    = false
}

mock_provider "spectrocloud" {
}

run "verify_aws_profile" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.aws_profile) == 1
    error_message = "No AWS cluster profile was created"
  }

}
