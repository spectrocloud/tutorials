variable "cluster_profile" {}
#variable "cluster_name" {}
#variable "sshkey" {}
#variable "subnet_cidr" {}
#variable "account_name" {}
#variable "project" {}
#variable "domain" {}
variable "region" {}
variable "cloud_name" {}
variable "aws-cloud-account-name" {
    type = string
    description = "The name of your AWS account as assigned in Palette"
}
/*
variable "azure-cloud-account-name" {
    type = string
    description = "The name of your Azure account as assigned in Palette"
}*/

variable "gcp-cloud-account-name" {
    type = string
    description = "The name of your GCP account as assigned in Palette"
}