terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.1"
      source  = "spectrocloud/spectrocloud"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }

  required_version = ">= 1.9"
}


provider "spectrocloud" {
  # API key set through the environment variable SPECTROCLOUD_APIKEY
  project_name = var.palette-project
}
