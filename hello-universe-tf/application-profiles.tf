resource "spectrocloud_application_profile" "hello-universe-ui" {
  name        = "hello-universe-ui-test"
  description = "Hello Universe as a single UI instance"
  pack {
    name            = "hello-universe-ui-test"
    type            = data.spectrocloud_pack_simple.container_pack.type
    registry_uid    = data.spectrocloud_registry.container_registry.id
    source_app_tier = data.spectrocloud_pack_simple.container_pack.id
    values          = <<-EOT
        containerService:
            serviceName: "hello-universe-ui-test"
            registryUrl: ""
            image: ${var.single-container-image}
            access: public
            ports:
              - "8080"
            serviceType: LoadBalancer
    EOT
  }
  tags = var.tags
}