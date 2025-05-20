# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 6 - Verify control plane, worker nodes, VM Resources cannot be set to 0.

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
  vmo-cluster-name                 = "name"
  cluster-profile-type             = "profile-type"
  cluster-profile-version          = "profile-version"
  ctl-node-min-cpu          = 0
  ctl-node-min-memory-mb    = 0
  wrk-node-min-cpu          = 0
  wrk-node-min-memory-mb    = 0
  pod_CIDR                  = "1.1.1.1/24"
  serviceClusterIpRange     = "1.1.1.1/24"
  metallb-ip-pool           = ["1.1.1.1"]
  vm-deploy-namespace       = "default"
  vm-deploy-name            = "name"
  vm-storage-Gi             = "64Gi"
  vm-cpu-cores              = 0
  vm-cpu-sockets            = 0
  vm-cpu-threads            = 0
  vm-memory-Gi              = "8Gi"
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
