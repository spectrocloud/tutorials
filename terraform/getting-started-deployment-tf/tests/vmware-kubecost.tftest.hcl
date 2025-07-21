# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 14

variables {
  deploy-vmware          = true
  deploy-vmware-kubecost = true
  db_password            = "test_password"
  auth_token             = "test_token"
  metallb_ip             = "test_ip"
  pcg_name               = "test_pcg"
  datacenter_name        = "test_datacenter"
  folder_name            = "test_folder"
  search_domain          = "test_search_domain"
  vsphere_cluster        = "test_cluster"
  datastore_name         = "test_datastore"
  network_name           = "test_network"
  resource_pool_name     = "test_resource_pool"
}

mock_provider "spectrocloud" {
}

run "verify_vmware_kubecost" {

  command = plan

  assert {
    condition     = length(spectrocloud_cluster_profile.vmware-profile) == 1
    error_message = "No VMware cluster profile was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_profile.vmware-profile-kubecost) == 1
    error_message = "No VMware cluster profile with Kubecost was created"
  }

  assert {
    condition     = length(spectrocloud_cluster_vsphere.vmware-cluster) == 1
    error_message = "No VMware cluster was created"
  }
}