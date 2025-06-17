# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 5 - Verify PCG name, domain, resource pools, AZs and node tags cannot have REPLACE ME values.

variables {

vm-deploy-namespace     = "REPLACE ME"
vm-deploy-name          = "REPLACE ME"
vm-labels               = ["REPLACE ME"]
vm-storage-Gi           = "REPLACE ME"
vm-cpu-cores            = 2
vm-cpu-sockets          = 1
vm-cpu-threads          = 2
vm-memory-Gi            = "REPLACE ME"




}

mock_provider "spectrocloud" {
}

run "verify_maas" {

  command = plan

  expect_failures = [
  ]
}
