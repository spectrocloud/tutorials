terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.14.1"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  // API key set though the environment variable SPECTROCLOUD_APIKEY
  project_name = "Default"
}

provider "vsphere" {
  // Credentials set though the environment variables VSPHERE_USER, VSPHERE_PASSWORD, and VSPHERE_SERVER
  allow_unverified_ssl = true
}