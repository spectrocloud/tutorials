terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.13.1"
      source  = "spectrocloud/spectrocloud"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.0"
    }
  }
}
provider "spectrocloud" {
  project_name = "Default"
}