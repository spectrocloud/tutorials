terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.11.0"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  project_name = "Default"
}