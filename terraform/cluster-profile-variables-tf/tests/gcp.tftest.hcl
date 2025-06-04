# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 7

variables {
  deploy-gcp = true
  db_password = "test_password"
  auth_token = "test_token"
  gcp-cloud-account-name = "test-account"
  gcp-region             = "test-region"
  gcp_project_name      = "test-aws-key-pair"
  gcp_control_plane_nodes = {
    count              = "1"
    control_plane      = true
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1"]
  }
  gcp_worker_nodes = {
    count              = "1"
    control_plane      = false
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1"]
  }
}

mock_provider "spectrocloud" {
}

run "verify_gcp" {

  command = plan

  assert {
        condition     = length(spectrocloud_cluster_profile.gcp-profile) == 1
        error_message = "No GCP cluster profile was created"
    }

  assert {
        condition     = length(spectrocloud_cluster_gcp.gcp-cluster) == 1
        error_message = "No GCP cluster was created"
    }

}
