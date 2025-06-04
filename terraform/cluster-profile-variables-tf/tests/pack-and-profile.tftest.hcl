# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 2

variables {
  deploy-aws = true
  # db_password = "REPLACE ME"
  # auth_token = "REPLACE ME" 
  wordpress_namespace = "REPLACE ME"       
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

mock_provider "spectrocloud" {}

run "wrong_variables" {

  command = plan

  expect_failures = [
    var.wordpress_namespace
  ]

}
