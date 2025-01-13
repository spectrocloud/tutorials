# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 2 - Verify MAAS profile and cluster are correctly planned when values are provided.

variables {
  deploy-maas = true
  deploy-maas-vm = false
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

}
