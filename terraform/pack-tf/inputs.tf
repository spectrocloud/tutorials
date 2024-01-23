# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

variable "cluster_profile_name" {
  type        = string
  description = "The name of the cluster profile."
  default     = "pack-tutorial-profile"
}

variable "cluster_profile_description" {
  type        = string
  description = "Provide a description of the cluster profile."
  default     = "My cluster profile as part of the packs tutorial."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
  default     = "pack-tutorial-cluster"
}


variable "instance_type" {
  type        = string
  description = "Specify the AWS instance type."
  default     = "m4.xlarge"
}

# ToDo: Provide a value for the variable below. The value will be the actual cloud account name added to your Palette project settings.
variable "cluster_cloud_account_aws_name" {
  type        = string
  description = "Specify the AWS account integrated with Palette. Use the same name as the one used in the Palette project settings."
}

# ToDo: Provide a value for the variable below. The value will be one of the [AWS regions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)
# The tutorial example uses "us-east-1" region. 
variable "aws_region_name" {
  type        = string
  description = "Specify the AWS region where you want to deploy the cluster."
}

# ToDo: Provide a value for the variable below. The value will be one of the [AWS Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)
# The tutorial example uses "us-east-1a" availability zone. 
variable "aws_az_names" {
  type        = list(string)
  description = "Provide a list of AWS Availability Zones. For example: ['us-east-1a', 'us-east-1b', 'us-east-1c']"
  default     = []
}

# ToDo: Provide a value for the variable below. The value will be the SSH key created in the AWS region where you will deploy the cluster.
variable "ssh_key_name" {
  type        = string
  description = "Specify the AWS Keypair available in the AWS region where you want to deploy the cluster."
}

# ToDo: Provide the name of your private registry server.
# The tutorial example uses "private-pack-registry". 
variable "private_pack_registry" {
  type        = string
  description = "The name of the private pack registry server."
}

variable "custom_addon_pack" {
  type        = string
  description = "Custom add-on pack name."
  default     = "hellouniverse"
}

variable "custom_addon_pack_version" {
  type        = string
  description = "Custom add-on pack version."
  default     = "1.0.0"
}

# ToDo: Set the use of OCI registry to true or false. 
# The default value is set as true.
variable "use_oci_registry" {
  type        = bool
  description = "Set the use of OCI registry to true or false. If you are not using an OCI registry, set this value to false."
  default     = true
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  # Value and key must be 63 characters or less, must start and end with an alphanumeric character, and can contain only alphanumeric characters, dots, dashes or underscores. 
  # Slashes `\` are not allowed.
  default = ["spectro-cloud-education", "app:hello-universe", "terraform_managed:true"]
}

locals {
  # Check if the user has provided a list of AWS Availability Zones. If not, use the first AZ from the list of available AZs in the region.
  azs = length(var.aws_az_names) != 0 ? var.aws_az_names : slice(data.aws_availability_zones.available.names, 0, 1)
}