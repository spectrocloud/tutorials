
variable "aws_cloud_account_name" {
  type        = string
  description = "The name of the AWS account registered in Palette."
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  default = [
    "spectro-cloud-education",
    "terraform_managed:true"
  ]
}


variable "aws_key_pair_name" {
  type        = string
  description = "The name of the AWS key pair to use for SSH access to the cluster. Refer to [EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) to learn more."
  default     = ""
}




locals {
  target_version = "1.0.0"
  cp-versions    = ["1.0.0", "1.0.1", "1.0.3"]

  packs = {
    "1.0.0" = {
      "csi-aws-ebs" = "1.22.0"
      "cni-calico"  = "3.26.1"
      "kubernetes"  = "1.27.5"
      "ubuntu-aws"  = "22.04"
    }
    "1.0.1" = {
      "csi-aws-ebs" = "1.24.0"
      "cni-calico"  = "3.26.1"
      "kubernetes"  = "1.27.5"
      "ubuntu-aws"  = "22.04"
    }
    "1.0.3" = {
      "csi-aws-ebs"    = "1.24.0"
      "cni-cilium-oss" = "1.14.3"
      "kubernetes"     = "1.28.3"
      "ubuntu-aws"     = "22.04"
    }
  }


  pack_data = {
    "csi-aws-ebs" = {
      data_source = data.spectrocloud_pack.csi-aws-ebs
    }
    "cni-calico" = {
      data_source = data.spectrocloud_pack.cni-calico
    }
    "kubernetes" = {
      data_source = data.spectrocloud_pack.kubernetes
    }
    "ubuntu-aws" = {
      data_source = data.spectrocloud_pack.ubuntu-aws
    }
    "cni-cilium-oss" = {
      data_source = data.spectrocloud_pack.cni-cilium-oss
    }
  }
}
