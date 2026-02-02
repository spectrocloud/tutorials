terraform {
  required_providers {
    spectrocloud = {
      source  = "spectrocloud/spectrocloud"
      version = ">= 0.20.6"
    }
  }

  required_version = ">= 1.9"
}

provider "spectrocloud" {
  project_name = var.palette_project
}
