resource "spectrocloud_cluster_config_template" "aws_template" {
  count = var.deploy-aws ? 1 : 0

  name       = "tf-cluster-template-aws"
  cloud_type = "aws"
  context    = "project"

  cluster_profile {
    id = spectrocloud_cluster_profile.aws_profile[0].id
  }

  policy {
    id   = spectrocloud_cluster_config_policy.maintenance.id
    kind = "maintenance"
  }
}

resource "spectrocloud_cluster_config_template" "azure_template" {
  count = var.deploy-azure ? 1 : 0

  name       = "tf-cluster-template"
  cloud_type = "azure"
  context    = "project"

  cluster_profile {
    id = spectrocloud_cluster_profile.azure_profile[0].id
  }

  policy {
    id   = spectrocloud_cluster_config_policy.maintenance.id
    kind = "maintenance"
  }
}
