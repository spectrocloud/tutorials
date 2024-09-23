# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 5

variables {
  deploy-aws = true
  db_password = "test_password"
  auth_token = "test_token"
  aws-cloud-account-name = "REPLACE ME"
  aws-region             = "REPLACE ME"
  aws-key-pair-name      = "REPLACE ME"
  aws_control_plane_nodes = {
    count              = "1"
    control_plane      = true
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["REPLACE ME"]
  }
  aws_worker_nodes = {
    count              = "1"
    control_plane      = false
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["REPLACE ME"]
  }
}

mock_provider "spectrocloud" {}

run "verify_aws" {

  command = plan

  expect_failures = [
    var.aws-cloud-account-name,
    var.aws-key-pair-name,
    var.aws-region,
    var.aws_control_plane_nodes.availability_zones,
    var.aws_worker_nodes.availability_zones
  ]

}
