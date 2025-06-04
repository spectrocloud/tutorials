# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 3

variables {
  deploy-aws-var = true
  db_password = "test_password"
  auth_token = "test_token"
  aws-cloud-account-name = "test-account"
  aws-region             = "test-region"
  aws-key-pair-name      = "test-aws-key-pair"
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
        condition     = length(spectrocloud_cluster_profile.aws-profile) == 1
        error_message = "No AWS cluster profile was created"
    }

  assert {
        condition     = length(spectrocloud_cluster_aws.aws-cluster) == 1
        error_message = "No AWS cluster was created"
    }

}
