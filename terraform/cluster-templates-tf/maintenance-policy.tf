resource "spectrocloud_cluster_config_policy" "weekly_maintenance" {
  name    = "tf-weekly-maintenance-policy"
  context = "project"

  schedules {
    name         = "sunday-maintenance"
    start_cron   = "0 2 * * SUN"
    duration_hrs = 4
  }

  tags = ["policy:maintenance", "cadence:weekly", "managed-by:terraform"]
}
