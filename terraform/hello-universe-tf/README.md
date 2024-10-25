# Hello Universe TF

This folder contains the demo code for the [Deploy an Application using Palette Dev Engine](https://docs.spectrocloud.com/devx/apps/deploy-app).
The code is intended to be used with the tutorial and as a result may not execute if invoked directly with `terraform apply`.

## Requirements

| Name                                                                              | Version   |
| --------------------------------------------------------------------------------- | --------- |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement_spectrocloud) | >= 0.21.6 |

## Providers

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider_spectrocloud) | 0.21.6  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                    | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [spectrocloud_application.scenario-1](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application)                              | resource    |
| [spectrocloud_application.scenario-2](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application)                              | resource    |
| [spectrocloud_application_profile.hello-universe-complete](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application_profile) | resource    |
| [spectrocloud_application_profile.hello-universe-ui](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/application_profile)       | resource    |
| [spectrocloud_virtual_cluster.cluster-1](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/virtual_cluster)                       | resource    |
| [spectrocloud_virtual_cluster.cluster-2](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/virtual_cluster)                       | resource    |
| [spectrocloud_cluster_group.cluster-group](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cluster_group)                    | data source |
| [spectrocloud_pack_simple.container_pack](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack_simple)                       | data source |
| [spectrocloud_pack_simple.postgres_service](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack_simple)                     | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry)                            | data source |

## Inputs

| Name                                                                                                         | Description                                                                            | Type           | Default                                                                                                                                                                             | Required |
| ------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_cluster-group-name"></a> [cluster-group-name](#input_cluster-group-name)                      | The name of the cluster group to use for the virtual cluster                           | `string`       | n/a                                                                                                                                                                                 |   yes    |
| <a name="input_database-name"></a> [database-name](#input_database-name)                                     | The name of the database                                                               | `string`       | `"counter"`                                                                                                                                                                         |    no    |
| <a name="input_database-ssl-mode"></a> [database-ssl-mode](#input_database-ssl-mode)                         | The SSL mode to use for the database                                                   | `string`       | `"require"`                                                                                                                                                                         |    no    |
| <a name="input_database-user"></a> [database-user](#input_database-user)                                     | The name of the database user                                                          | `string`       | `"pguser"`                                                                                                                                                                          |    no    |
| <a name="input_database-version"></a> [database-version](#input_database-version)                            | The version of Postgres to use                                                         | `string`       | `"14"`                                                                                                                                                                              |    no    |
| <a name="input_enable-second-scenario"></a> [enable-second-scenario](#input_enable-second-scenario)          | Whether to enable the second scenario                                                  | `bool`         | `false`                                                                                                                                                                             |    no    |
| <a name="input_multiple_container_images"></a> [multiple_container_images](#input_multiple_container_images) | The name of the container images to use for the virtual cluster in a multiple scenario | `map(string)`  | <pre>{<br> "api": "ghcr.io/spectrocloud/hello-universe-api:1.0.8",<br> "ui": "ghcr.io/spectrocloud/hello-universe:1.0.12"<br>}</pre>                                                |    no    |
| <a name="input_scenario-one-cluster-name"></a> [scenario-one-cluster-name](#input_scenario-one-cluster-name) | The name of the cluster to use for the virtual cluster                                 | `string`       | `"cluster-1"`                                                                                                                                                                       |    no    |
| <a name="input_scenario-two-cluster-name"></a> [scenario-two-cluster-name](#input_scenario-two-cluster-name) | The name of the cluster to use for the virtual cluster in the second scenario          | `string`       | `"cluster-2"`                                                                                                                                                                       |    no    |
| <a name="input_single-container-image"></a> [single-container-image](#input_single-container-image)          | The name of the container image to use for the virtual cluster in a single scenario    | `string`       | `"ghcr.io/spectrocloud/hello-universe:1.0.12"`                                                                                                                                      |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | The default tags to apply to Palette resources                                         | `list(string)` | <pre>[<br> "spectro-cloud-education",<br> "app:hello-universe",<br> "repository:spectrocloud/tutorials/",<br> "terraform_managed:true",<br> "tutorial:hello-universe-tf"<br>]</pre> |    no    |
| <a name="input_token"></a> [token](#input_token)                                                             | The anonymous token to use for the Spectro Cloud API                                   | `string`       | `"931A3B02-8DCC-543F-A1B2-69423D1A0B94"`                                                                                                                                            |    no    |

## Outputs

| Name                                                        | Description |
| ----------------------------------------------------------- | ----------- |
| <a name="output_Advisory"></a> [Advisory](#output_Advisory) | n/a         |
