# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 3 - Verify MAAS profile, cluster and VM are correctly planned when values are provided.

variables {
  deploy-maas = true
  deploy-maas-vm = true
  pcg-name = "test-pcg"
  maas-domain = "test-domain"
  maas-worker-nodes         = 1 
  maas-worker-resource-pool = "test-worker-pool"
  maas-worker-azs           = ["test-worker-az"]
  maas-worker-node-tags     = ["test-worker-tags"]
  maas-control-plane-nodes         = 1 
  maas-control-plane-resource-pool = "test-cp-pool"
  maas-control-plane-azs           = ["test-cp-az"] 
  maas-control-plane-node-tags     = ["test-cp-tags"]
  vmo-cluster-name                 = "name"
  cluster-profile-type             = "profile-type"
  cluster-profile-version          = "profile-version"
  ctl-node-min-cpu          = 1
  ctl-node-min-memory-mb    = 16384
  wrk-node-min-cpu          = 1
  wrk-node-min-memory-mb    = 16384
  pod_CIDR                  = "1.1.1.1/24"
  serviceClusterIpRange     = "1.1.1.1/24"
  metallb-ip-pool           = ["1.1.1.1"]
  vm-deploy-namespace       = "default"
  vm-deploy-name            = "name"
  vm-storage-Gi             = "64Gi"
  vm-cpu-cores              = 2
  vm-cpu-sockets            = 1
  vm-cpu-threads            = 2
  vm-memory-Gi              = "8Gi"
}

mock_provider "spectrocloud" {
}

run "verify_maas" {

  command = plan

  assert {
        condition     = length(spectrocloud_cluster_profile.maas-vmo-profile) == 1
        error_message = "No MAAS cluster profile was created"
    }

  assert {
        condition     = length(spectrocloud_cluster_maas.maas-cluster) == 1
        error_message = "No MAAS cluster was created"
    }

  assert {
        condition     = length(spectrocloud_virtual_machine.virtual-machine) == 1
        error_message = "No MAAS VM was created"
    }

}
