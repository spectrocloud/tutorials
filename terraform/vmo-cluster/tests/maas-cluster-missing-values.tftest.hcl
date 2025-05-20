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
  vmo-cluster-name                 = ""
  cluster-profile-type             = ""
  cluster-profile-version          = ""
  ctl-node-min-cpu          = 1
  ctl-node-min-memory-mb    = 16384
  wrk-node-min-cpu          = 1
  wrk-node-min-memory-mb    = 16384
  pod_CIDR                  = ""
  serviceClusterIpRange     = ""
  metallb-ip-pool           = []
  vm-deploy-namespace       = ""
  vm-deploy-name            = ""
  vm-storage-Gi             = ""
  vm-cpu-cores              = 2
  vm-cpu-sockets            = 1
  vm-cpu-threads            = 2
  vm-memory-Gi              = ""
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
