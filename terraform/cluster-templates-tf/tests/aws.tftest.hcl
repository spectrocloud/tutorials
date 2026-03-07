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

run "verify_aws_template" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_config_template.aws_template) == 1
    error_message = "No AWS cluster template was created"
  }

}
