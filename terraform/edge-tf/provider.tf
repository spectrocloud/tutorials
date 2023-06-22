terraform {
  required_version = ">= 1.3.9"

  required_providers {
    spectrocloud = {
      version = "= 0.14.0"
      source  = "spectrocloud/spectrocloud"
    }
  }
}

provider "spectrocloud" {
  # The commented variables below will help if you are using Palette on-prem. 
  # host         = var.sc_host          # Spectro Cloud endpoint. Defaults to api.spectrocloud.com
  # username     = var.sc_username      # Palette Username. Either define it in the terraform.tfvars file or specify with environment variable SPECTROCLOUD_USERNAME
  # password     = var.sc_password      # Palette Password. Either define it in the terraform.tfvars file or specify with environment variable SPECTROCLOUD_PASSWORD
  api_key      = var.sc_api_key         # API key. Either define it in the terraform.tfvars file or specify with environment variable SPECTROCLOUD_APIKEY
  project_name = var.sc_project_name
}