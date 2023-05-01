variable "aws-cloud-account-name" {
  type        = string
  description = "The name of your AWS account as assigned in Palette"
  default     = ""
}
variable "gcp-cloud-account-name" {
  type        = string
  description = "The name of your GCP account as assigned in Palette"
  default     = ""
}

variable "azure-cloud-account-name" {
  type        = string
  description = "The name of your Azure account as assigned in Palette"
  default     = ""
}

variable "deploy-aws" {
  type        = bool
  description = "A flag for enabling a deployment on AWS"
}

variable "deploy-gcp" {
  type        = bool
  description = "A flag for enabling a deployment on GCP"
}

variable "deploy-azure" {
  type        = bool
  description = "A flag for enabling a deployment on Azure"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
  default     = ""
}

variable "azure_resource_group" {
  type        = string
  description = "Azure resource group"
  default     = ""
}

variable "aws-region" {
  type        = string
  description = "AWS region"
}

variable "gcp-region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "azure-region" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}


variable "azure-key-pair-name" {
  type        = string
  description = "The name of the Azure key pair to use for SSH access to the cluster. Refer to [Azure Key Pairs](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys) to learn more."
  default     = ""
}


variable "aws-key-pair-name" {
  type        = string
  description = "The name of the AWS key pair to use for SSH access to the cluster. Refer to [EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) to learn more."
  default     = ""
}

variable "aws_master_nodes" {
  type = object({
    count              = string
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count              = "1"
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1a"]
  }
  description = "AWS master nodes configuration."
}
variable "aws_worker_nodes" {
  type = object({
    count              = string
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count              = "1"
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1a"]
  }
  description = "AWS worker nodes configuration."
}

variable "azure_master_nodes" {
  type = object({
    count               = string
    instance_type       = string
    disk_size_gb        = string
    availability_zones  = list(string)
    is_system_node_pool = bool
  })
  default = {
    count              = "1"
    instance_type      = "Standard_A8_v2."
    disk_size_gb       = "60"
    availability_zones = ["1"]
  is_system_node_pool = false }
  description = "Azure master nodes configuration."
}

variable "azure_worker_nodes" {
  type = object({
    count               = string
    instance_type       = string
    disk_size_gb        = string
    availability_zones  = list(string)
    is_system_node_pool = bool
  })
  default = {
    count              = "1"
    instance_type      = "Standard_A8_v2."
    disk_size_gb       = "60"
    availability_zones = ["1"]
  is_system_node_pool = false }
  description = "Azure worker nodes configuration."
}

variable "gcp_master_nodes" {
  type = object({
    count              = string
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count         = "1"
    instance_type = "n1-standard-4"
    disk_size_gb  = "60"
  availability_zones = ["us-central1-a"] }
  description = "GCP master nodes configuration."
}

variable "gcp_worker_nodes" {
  type = object({
    count              = string
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count         = "1"
    instance_type = "n1-standard-4"
    disk_size_gb  = "60"
  availability_zones = ["us-central1-a"] }
  description = "GCP worker nodes configuration."
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  default = [
    "spectro-cloud-education",
    "app:hello-universe",
    "repository:spectrocloud/tutorials/",
    "terraform_managed:true",
    "tutorial:iaas-cluster-deployment-tf"
  ]
}