terraform {
  required_providers {
    spectrocloud = {
      version = "= 0.11.1"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  project_name = "Default"
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}