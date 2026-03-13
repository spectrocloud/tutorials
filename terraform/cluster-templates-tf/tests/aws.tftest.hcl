variables {
  palette-project        = "Default"
  app_port               = 8080
  deploy-aws             = true
  deploy-azure           = false
  azure-use-azs          = false
  aws-cloud-account-name = "test-account"
  aws-region             = "us-east-1"
  aws-key-pair-name      = "test-key-pair"
  aws_control_plane_nodes = {
    count              = "1"
    control_plane      = true
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1"]
  }
  aws_worker_nodes = {
    count              = "1"
    control_plane      = false
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1"]
  }
}

mock_provider "spectrocloud" {
}

run "verify_aws" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.aws_profile) == 1
    error_message = "No AWS cluster profile was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_config_template.aws_template) == 1
    error_message = "No AWS cluster template was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_aws.dev_cluster) == 1
    error_message = "No AWS cluster was created"
  }

  assert {
    condition     = spectrocloud_cluster_aws.dev_cluster[0].cluster_timezone == "UTC"
    error_message = "AWS cluster timezone is not set to UTC"
  }

}
