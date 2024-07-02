# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 15

variables {
  deploy-vmware = true
  db_password = "test_password"
  auth_token = "test_token"
  metallb_ip         = "REPLACE ME"  
  pcg_name           = "REPLACE ME" 
  datacenter_name    = "REPLACE ME" 
  folder_name        = "REPLACE ME" 
  search_domain      = "REPLACE ME" 
  vsphere_cluster    = "REPLACE ME" 
  datastore_name     = "REPLACE ME"
  network_name       = "REPLACE ME" 
  resource_pool_name = "REPLACE ME"
}

mock_provider "spectrocloud" {}

run "verify_vmware" {

  command = plan

  expect_failures = [
    var.metallb_ip,
    var.pcg_name,
    var.datacenter_name,
    var.folder_name,
    var.search_domain,
    var.vsphere_cluster,
    var.datastore_name,
    var.network_name,
    var.resource_pool_name
  ]

}
