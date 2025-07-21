# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.16.1"
      source  = "spectrocloud/spectrocloud"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "spectrocloud" {
  # API key set though the environment variable SPECTROCLOUD_APIKEY
  project_name = "Default"
}