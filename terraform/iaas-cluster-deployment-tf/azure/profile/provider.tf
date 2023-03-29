terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.11.1"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  project_name = "Default"
  api_key      = var.spectrocloud_api_key
}