terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.11.1"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  // API key set though the environment variable SPECTROCLOUD_APIKEY
  project_name = "Default"
}