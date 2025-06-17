# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 4 - Verify PCG name, domain, resource pools, AZs and node tags cannot be empty.

variables {
  deploy-maas = true
  deploy-maas-vm = false
  vm-deploy-namespace     = ""
  vm-deploy-name          = ""
  vm-labels               = []
  vm-storage-Gi           = ""
  vm-cpu-cores            = 1
  vm-cpu-sockets          = 1
  vm-cpu-threads          = 2
  vm-memory-Gi            = ""

}

mock_provider "spectrocloud" {
}

run "verify_maas" {

  command = plan

  expect_failures = [
    var.vm-deploy-namespace, 
    var.vm-deploy-name,
    var.vm-labels,
    var.vm-storage-Gi, 
    var.vm-memory-Gi,
  ]
}
