# Hello Universe TF

This folder contains the demo code for the [Deploy an Application using Palette Dev Engine](https://docs.spectrocloud.com/devx/apps/deploy-app).
The code is intended to be used with the tutorial and as a result may not execute if invoked directly with `terraform apply`.



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_application.hello-universe-ui](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application) | resource |
| [spectrocloud_application_profile.hello-universe-ui](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application_profile) | resource |
| [spectrocloud_virtual_cluster.cluster-1](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/virtual_cluster) | resource |
| [spectrocloud_cluster_group.beehive](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cluster_group) | data source |
| [spectrocloud_pack_simple.container_pack](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack_simple) | data source |
| [spectrocloud_registry.container_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster-group-name"></a> [cluster-group-name](#input\_cluster-group-name) | The name of the cluster group to use for the virtual cluster | `string` | `"beehive"` | no |
| <a name="input_scenario-one-cluster-name"></a> [scenario-one-cluster-name](#input\_scenario-one-cluster-name) | The name of the cluster to use for the virtual cluster | `string` | n/a | yes |
| <a name="input_scenario-two-cluster-name"></a> [scenario-two-cluster-name](#input\_scenario-two-cluster-name) | The name of the cluster to use for the virtual cluster in the second scenario | `string` | n/a | yes |
| <a name="input_single-container-image"></a> [single-container-image](#input\_single-container-image) | The name of the container image to use for the virtual cluster in a single scenario | `string` | `"ghcr.io/spectrocloud/hello-universe:1.0.8"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "scenario-1",<br>  "spectro-cloud-education",<br>  "app:hello-universe"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_beehive"></a> [beehive](#output\_beehive) | n/a |
