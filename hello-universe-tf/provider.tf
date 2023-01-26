terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.11.0"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  // API key set though the environment variable SPECTROCLOUD_API_KEY
  project_name = "Default"
}