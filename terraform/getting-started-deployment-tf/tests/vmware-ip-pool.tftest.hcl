# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 17

variables {
  deploy-vmware        = true
  deploy-vmware-static = true
  db_password          = "test_password"
  auth_token           = "test_token"
  metallb_ip           = "test_ip"
  pcg_name             = "test_pcg"
  datacenter_name      = "test_datacenter"
  folder_name          = "test_folder"
  search_domain        = "test_search_domain"
  vsphere_cluster      = "test_cluster"
  datastore_name       = "test_datastore"
  network_name         = "test_network"
  resource_pool_name   = "test_resource_pool"
}

mock_provider "spectrocloud" {}

run "verify_vmware" {

  command = plan

  assert {
    condition     = length(spectrocloud_privatecloudgateway_ippool.ippool) == 1
    error_message = "No VMware IP pool was created"
  }
}
