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
  vmo-network-interface   = ["REPLACE ME"]
  vm-vlans                = 1
  host-vlans              = 1
  pod-CIDR                = ["REPLACE ME"]
  cluster-services-CIDR   = ["REPLACE ME"]
  metallb-ip-pool         = ["REPLACE ME"]
  node-network            = "REPLACE ME"
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
    var.maas-control-plane-node-tags,
    var.vmo-network-interface,
    var.pod-CIDR,
    var.cluster-services-CIDR,
    var.metallb-ip-pool,
    var.node-network
  ]
}
