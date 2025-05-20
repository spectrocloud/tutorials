# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 5 - Verify PCG name, domain, resource pools, AZs and node tags cannot have REPLACE ME values.

variables {
  deploy-maas = true
  deploy-maas-vm = false
  pcg-name = "REPLACE ME"
  maas-domain = "REPLACE ME"
  maas-worker-nodes         = 1 
  maas-worker-resource-pool = "REPLACE ME"
  maas-worker-azs           = ["REPLACE ME"]
  maas-worker-node-tags     = ["REPLACE ME"]
  maas-control-plane-nodes         = 1 
  maas-control-plane-resource-pool = "REPLACE ME" 
  maas-control-plane-azs           = ["REPLACE ME"] 
  maas-control-plane-node-tags     = ["REPLACE ME"]
  vmo-cluster-name                 = "REPLACE ME"
  cluster-profile-type             = "REPLACE ME"
  cluster-profile-version          = "REPLACE ME"
  ctl-node-min-cpu          = 1
  ctl-node-min-memory-mb    = 16384
  wrk-node-min-cpu          = 1
  wrk-node-min-memory-mb    = 16384
  pod_CIDR                  = "REPLACE ME"
  serviceClusterIpRange     = "REPLACE ME"
  metallb-ip-pool           = ["REPLACE ME"]
  vm-deploy-namespace       = "REPLACE ME"
  vm-deploy-name            = "REPLACE ME"
  vm-storage-Gi             = "REPLACE ME"
  vm-cpu-cores              = 2
  vm-cpu-sockets            = 1
  vm-cpu-threads            = 2
  vm-memory-Gi              = "REPLACE ME"
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
