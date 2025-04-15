# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 6 - Verify control plane and worker nodes cannot be set to 0.

variables {
  deploy-maas = true
  deploy-maas-vm = false
  pcg-name = "test-pcg"
  maas-domain = "test-domain"
  maas-worker-nodes         = 0 
  maas-worker-resource-pool = "test-worker-pool"
  maas-worker-azs           = ["test-worker-az"]
  maas-worker-node-tags     = ["test-worker-tags"]
  maas-control-plane-nodes         = 0 
  maas-control-plane-resource-pool = "test-cp-pool" 
  maas-control-plane-azs           = ["test-cp-az"]
  maas-control-plane-node-tags     = ["test-cp-tags"]
}

mock_provider "spectrocloud" {
}

run "verify_maas" {

  command = plan

  expect_failures = [
      var.maas-worker-nodes,
      var.maas-control-plane-nodes
    ]
}
