[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Developed by: Spectro Cloud](https://img.shields.io/badge/Developed%20by-Spectro%20Cloud-blueviolet)](https://www.spectrocloud.com)

# Palette Edge Native Terraform Module

The Spectro Cloud Provider for Palette is available in the [Terraform Registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest).  This repository contains the module and examples to create a Kubernetes Edge Cluster using Palette.  

## Assumptions

Addon profiles that will be used for the cluster creation have already been defined.  This module will reference those resources rather than create them.  Profiles can be created through the [Cluster Profile Resource](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile)


## Usage

Module Version |  Required Terraform Version
---------------|----------------------------
  <= 1.0.0     |        <= 1.2.9
  \>= 1.1.0     |        >= 1.3.0

See the [Examples](https://github.com/spectrocloud/terraform-palette-edge/tree/main/examples) for usage of this module.  This module is written for the Edge Native Deployment option.

This is a sample "main.tf" file.  In this example, we are creating a 3-node Ubuntu-PXKE 1.24 cluster.  This cluster has a basic profile for the Ubuntu Operating System, PXK-E (Palette Optimized Kubernetes for the Edge), a CNI, and a few other example profiles.  These profiles were created ahead of time.

Additionally, with the "VIP" tag, we enable Kubevip for HA.  The Edge Host is now looked up via the "tag" on the Edge Host.  Multiple tags can be used for this purpose.  See the example for usage with multiple pools.  The Tag(s) should be added to the Edge Host before running the plan.  This applies to virtual machines as well.


```
module "edge-demo-module" {
  source  = "spectrocloud/edge/spectrocloud"
  version = "1.2.0"
  # Store Number/Location
  name = "demo"
  # add tags to the cluster (optional) list(strings)
  cluster_tags = ["origin:terraform"]

  # Cluster VIP to be used with KubeVIP
  cluster_vip = "10.100.100.32"

  # Node Pools for Cluster
  machine_pools = [
    # Control Plane Node Pool
    {
      name                    = "control-plane"
      control_plane           = true
      control_plane_as_worker = false
      additional_labels = {
        "region" : "east"
      }
      edge_host = [
        {
          host_uid  = "host-1"
          static_ip = "11.1.1.1"
        }
      ]
    },
    # Add additional node pools
    {
      name          = "gpu"
      control_plane = false
      edge_host = [

        {
          host_uid  = "host-2"
          static_ip = "2.2.2.2"
        }
      ]
      additional_labels = {
        "type" : "gpu",
        "region" : "east"
      }
    }

  ]

  # Profiles to be added Profile should be an Edge-Native Infra or Full Profile with the OS, Kubernetes Distribution and CNI of choice
  cluster_profiles = [
    {
      name    = "ubuntu-k3s"
      tag     = "1.24.6"
      context = "project"
    },
    {
      name    = "edge-services"
      tag     = "1.0.0"
      context = "project"
    },
    {
      name    = "kubevirt"
      tag     = "1.0.0"
      context = "project"
    },
  ]
  # Cluster Geolocation (Optional)
  location = {
    latitude  = 40.442829
    longitude = -79.950432
  }
  rbac_bindings = [
    {
      rbac_type = "ClusterRoleBinding"
      rbac_role = {
        name = "cluster-admin"
        kind = "ClusterRole"
      }
      subjects = [
        {
          name      = "k8s-admin"
          rbac_type = "Group"
        }
      ]
    }
  ]

}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | >= 0.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_edge_native.this](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_edge_native) | resource |
| [spectrocloud_cluster_profile.this](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cluster_profile) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_binding_role"></a> [binding\_role](#input\_binding\_role) | Role binding type to be created with the cluster. | `map(string)` | `null` | no |
| <a name="input_binding_type"></a> [binding\_type](#input\_binding\_type) | Role binding type to be created with the cluster. | `string` | `null` | no |
| <a name="input_cluster_profiles"></a> [cluster\_profiles](#input\_cluster\_profiles) | Values for the profile(s) to be used for cluster creation.  For `context` a value of [project tenant system] is expected. | <pre>list(object({<br>    name    = string<br>    tag     = optional(string)<br>    context = string # project tenant system<br>    packs = optional(list(object({<br>      name   = string<br>      tag    = string<br>      values = optional(string)<br>      manifest = optional(list(object({<br>        name    = string<br>        tag     = string<br>        content = string<br>      })))<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | Tags to be added to the profile.  key:value | `list(string)` | `[]` | no |
| <a name="input_cluster_vip"></a> [cluster\_vip](#input\_cluster\_vip) | IP Address for Cluster VIP for HA.  Must be unused on on the same layer 2 segment as the node IPs. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Optional - If used Latitude and Longitude represent the coordinates of the location you wish to assign to the cluster.  https://www.latlong.net/ is one tool that can be used to find this. | <pre>object({<br>    latitude  = optional(number)<br>    longitude = optional(number)<br>  })</pre> | <pre>{<br>  "latitude": 0,<br>  "longitude": 0<br>}</pre> | no |
| <a name="input_machine_pools"></a> [machine\_pools](#input\_machine\_pools) | Values for the attributes of the Node Pools.  'edge\_host\_tags' is used to lookup the Edge Host already registered with Palette. | <pre>list(object({<br>    name                    = string<br>    additional_labels       = optional(map(string))<br>    control_plane           = optional(bool)<br>    control_plane_as_worker = optional(bool)<br>    taints = optional(list(object({<br>      effect = string<br>      key    = string<br>      value  = string<br>    })))<br>    edge_host = list(object({<br>      host_uid  = string<br>      static_ip = optional(string)<br><br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster to be created. | `string` | n/a | yes |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | n/a | `list(string)` | `[]` | no |
| <a name="input_rbac_bindings"></a> [rbac\_bindings](#input\_rbac\_bindings) | RBAC Bindings to be added to the cluster | <pre>list(object({<br>    rbac_type = string<br>    namespace = optional(string)<br>    rbac_role = optional(map(string))<br>    subjects = optional(list(object({<br>      name      = string<br>      rbac_type = string<br>      namespace = optional(string)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_skip_wait_for_completion"></a> [skip\_wait\_for\_completion](#input\_skip\_wait\_for\_completion) | n/a | `bool` | `true` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->