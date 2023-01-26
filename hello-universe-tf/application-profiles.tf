##########################################
# Scenario 1: Single Application
##########################################
resource "spectrocloud_application_profile" "hello-universe-ui" {
  name        = "hello-universe-ui"
  description = "Hello Universe as a single UI instance"
  version     = "1.0.0"
  pack {
    name            = "hello-universe-ui"
    type            = data.spectrocloud_pack_simple.container_pack.type
    registry_uid    = data.spectrocloud_registry.container_registry.id
    source_app_tier = data.spectrocloud_pack_simple.container_pack.id
    values          = <<-EOT
        containerService:
            serviceName: "ui"
            image: ${var.single-container-image}
            access: public
            ports:
              - "8080"
            serviceType: LoadBalancer
    EOT
  }
  tags = concat(var.tags, ["scenario-1"])
}
##########################################
# Scenario 2: Multiple Applications
##########################################

resource "spectrocloud_application_profile" "hello-universe-complete" {
  name        = "hello-universe-complete"
  description = "Hello Universe as a three-tier application"
  version     = "1.0.0"
  pack {
    name            = "postgres-db"
    type            = data.spectrocloud_pack_simple.postgres_service.type
    source_app_tier = data.spectrocloud_pack_simple.postgres_service.id
    properties = {
      "dbUserName"         = var.database-user
      "databaseName"       = var.database-name
      "databaseVolumeSize" = "8"
      "version"            = "14"
    }
  }
  pack {
    name            = "api"
    type            = data.spectrocloud_pack_simple.container_pack.type
    registry_uid    = data.spectrocloud_registry.container_registry.id
    source_app_tier = data.spectrocloud_pack_simple.container_pack.id
    values          = <<-EOT
          containerService:
            serviceName: "api"
            image: ${var.multiple_container_images["api"]}
            access: private
            ports:
              - "3000"
            env:
              - name: "DB_HOST"
                value: "{{.spectro.app.$appDeploymentName.postgres-db.POSTGRESMSTR_SVC}}"
              - name: "DB_USER"
                value: "{{.spectro.app.$appDeploymentName.postgres-db.USERNAME}}"
              - name: "DB_PASSWORD"
                value: "{{.spectro.app.$appDeploymentName.postgres-db.PASSWORD}}"
              - name: "DB_NAME"
                value: "${var.database-name}"
              - name: "DB_INIT"
                value: "true"
              - name: "DB_ENCRYPTION"
                value: "${var.database-ssl-mode}"
              - name: "AUTHORIZATION"
                value: "true"

    EOT
  }
  pack {
    name            = "ui"
    type            = data.spectrocloud_pack_simple.container_pack.type
    registry_uid    = data.spectrocloud_registry.container_registry.id
    source_app_tier = data.spectrocloud_pack_simple.container_pack.id
    values          = <<-EOT
        containerService:
            serviceName: "ui"
            image: ${var.multiple_container_images["ui"]}
            access: public
            ports:
              - "8080"
              - "3000"
            env:
              - name: "API_URI"
                value: "?????"
              - name: "SVC_URI"
                value: "http://{{.spectro.app.$appDeploymentName.api.CONTAINER_SVC}}:{{.spectro.app.$appDeploymentName.api.CONTAINER_SVC_PORT}}"
              - name: "TOKEN"
                value: "${var.token}"
            serviceType: LoadBalancer
    EOT   
  }
  tags = concat(var.tags, ["scenario-2"])
}