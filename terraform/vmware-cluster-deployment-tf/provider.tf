# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.16.1"
      source  = "spectrocloud/spectrocloud"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.6.1"
    }
  }
}

provider "spectrocloud" {
  # API key set through the environment variable SPECTROCLOUD_APIKEY
  project_name = "Default"
}