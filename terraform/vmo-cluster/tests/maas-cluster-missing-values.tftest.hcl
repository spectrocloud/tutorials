# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 4 - Verify PCG name, domain, resource pools, AZs and node tags cannot be empty.

variables {
  deploy-maas = true
  deploy-maas-vm = false
  pcg-name = ""
  maas-domain = ""
  maas-worker-nodes         = 1 
  maas-worker-resource-pool = ""
  maas-worker-azs           = []
  maas-worker-node-tags     = []
  maas-control-plane-nodes         = 1 
  maas-control-plane-resource-pool = "" 
  maas-control-plane-azs           = [] 
  maas-control-plane-node-tags     = []
}

mock_provider "spectrocloud" {
}

run "verify_maas" {

  command = plan

  expect_failures = [
    var.pcg-name, 
    var.maas-domain,
    var.maas-worker-resource-pool,
    var.maas-worker-azs, 
    var.maas-worker-node-tags,
    var.maas-control-plane-resource-pool,
    var.maas-control-plane-azs, 
    var.maas-control-plane-node-tags
  ]
}
