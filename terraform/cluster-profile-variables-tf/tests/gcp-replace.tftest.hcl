# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 8

variables {
  deploy-gcp = true
  deploy-gcp-var = true
  db_password = "test_password"
  auth_token = "test_token"
  gcp-cloud-account-name = "REPLACE ME"
  gcp-region             = "REPLACE ME"
  gcp_project_name      = "REPLACE ME"
  gcp_control_plane_nodes = {
    count              = "1"
    control_plane      = true
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["REPLACE ME"]
  }
  gcp_worker_nodes = {
    count              = "1"
    control_plane      = false
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["REPLACE ME"]
  }
}

mock_provider "spectrocloud" {}

run "verify_gcp" {

  command = plan

  expect_failures = [
    var.gcp-cloud-account-name,
    var.gcp_project_name,
    var.gcp-region,
    var.gcp_control_plane_nodes.availability_zones,
    var.gcp_worker_nodes.availability_zones
  ]

}
