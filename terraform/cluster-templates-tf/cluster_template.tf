resource "spectrocloud_cluster_config_template" "aws_template_with_maintenance" {
  name        = "aws-template-with-maintenance"
  cloud_type  = "aws"

  cluster_profile {
    id = spectrocloud_cluster_profile.aws_profile.id
  }

  policy {
    id   = spectrocloud_cluster_config_policy.weekly_maintenance.id
    kind = "maintenance"
  }
}
