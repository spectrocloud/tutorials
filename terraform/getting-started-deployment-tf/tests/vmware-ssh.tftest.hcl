# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0
# Test case 16

variables {
  deploy-vmware = true
  db_password = "test_password"
  auth_token = "test_token"
  metallb_ip         = "test_ip"  
  pcg_name           = "test_pcg" 
  datacenter_name    = "test_datacenter" 
  folder_name        = "test_folder" 
  search_domain      = "test_search_domain" 
  vsphere_cluster    = "test_cluster" 
  datastore_name     = "test_datastore"
  network_name       = "test_network" 
  resource_pool_name = "test_resource_pool"
  ssh_key = ""
  ssh_key_private = ""
}

mock_provider "spectrocloud" {
}

run "verify_vmware" {

  command = plan

  assert {
        condition     = length(tls_private_key.tutorial_ssh_key) == 1
        error_message = "No SSH key was created"
    }

  assert {
        condition     = length(local_sensitive_file.private_key_file) == 1
        error_message = "The file to store the private key was not created"
    }

  assert {
        condition     = length(local_file.public_key_file) == 1
        error_message = "The file to store the public key was not created"
    }

}
