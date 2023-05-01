terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.13.1"
      source  = "spectrocloud/spectrocloud"
    }
  }
}
provider "spectrocloud" {
  project_name = "Default"
}