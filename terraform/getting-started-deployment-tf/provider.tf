# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_providers {
    spectrocloud = {
      version = ">= 0.19.0-pre"
      source  = "spectrocloud/spectrocloud"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.6.1"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }

  required_version = ">= 1.5"
}


provider "spectrocloud" {
  # API key set through the environment variable SPECTROCLOUD_APIKEY
  project_name = "Default"
}