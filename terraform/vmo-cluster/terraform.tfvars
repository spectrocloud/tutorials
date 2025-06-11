# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

#####################
# Palette Settings
#####################
palette-project = "Default" # The name of your project in Palette.

############################
# MAAS Deployment Settings
############################

deploy-maas                      = true        # Set to true to deploy to a new VMO cluster to MAAS.
deploy-maas-vm                   = false       # Set to true to create a VM on MAAS VMO cluster once deployed.
pcg-name                         = "maas-pcg"  # Provide the name of the PCG that will be used to deploy the Palette cluster.
maas-domain                      = "maas.sc"   # Provide the MAAS domain that will be used to deploy the Palette cluster.
maas-control-plane-nodes         = 1           # Provide the number of control plane nodes that will be used for the Palette cluster.
maas-control-plane-resource-pool = "docs"      # Provide a resource pool for the control plane nodes.
maas-control-plane-azs           = ["az1"]     # Provide a set of availability zones for the control plane nodes.
maas-control-plane-node-tags     = ["docs-cp"] # Provide a set of node tags for the control plane nodes.
ctl-node-min-cpu                 = 6           # Minimum number of CPU cores required for control plane nodes
ctl-node-min-memory-mb           = 8096        # Minimum amount of RAM (memory) required for control plane nodes
maas-worker-nodes                = 1           # Provide the number of worker nodes that will be used for the Palette cluster.
maas-worker-resource-pool        = "docs"      # Provide a resource pool for the worker nodes.
maas-worker-azs                  = ["az1"]     # Provide a set of availability zones for the worker nodes.
maas-worker-node-tags            = ["docs"]    # Provide a set of node tags for the worker nodes.
wrk-node-min-cpu                 = 8           # Minimum number of CPU cores required for worker nodes
wrk-node-min-memory-mb           = 16384       # Minimum amount of RAM (memory) required for worker nodes

#####################
# cluster_profiles.tf
#####################

vmo-cluster-name        = "vmo-cluster-maas"
cluster-profile-type    = "cluster" # infra, cluster, add-on, or system
cluster-profile-version = "1.0.0"   # Version number for the cluster profile in Palette

#####################
# vmo-values.tf
####################
vmo-network-interface = ["br0"]
vm-vlans              = 1
host-vlans            = 1

###########################
# manifests/k8s-values.yaml
###########################
pod-CIDR              = ["100.64.0.0/18"] # Set the subnet that your pods will run on
cluster-services-CIDR = ["100.64.64.0/18"]

###############################
# manifests/metallb-values.yaml
###############################
metallb-ip-pool = ["10.11.130.129-10.11.130.131"] # IP addresses to be assigned for use by MetalLB

###############################
# manifests/ubuntu-values.yaml
###############################
node-network = "10.11.130.129-10.11.130.131" # IP addresses to be assigned for use by MetalLB

#####################
# virtual_machines.tf
#####################
vm-deploy-namespace = "virtual-machines" # Namespace where your VM will be deployed.
vm-deploy-name      = "vmo-vm"           # The name of your VM
vm-labels           = ["my-vmo-vm"]      # Labels that will be applied to your VM.
vm-storage-Gi       = "50Gi"             # Size of the disk (PVC) that your VM will have.
vm-cpu-cores        = 2                  # Number of CPU cores your VM will have.
vm-cpu-sockets      = 1                  # Number of physical CPU sockets the CPU cores should be spread over.
vm-cpu-threads      = 2                  # Number of CPU threads to use for the VM CPU
vm-memory-Gi        = "4Gi"              # Amount of RAM (memory) your VM will have

#####################
# vmo-extras-manifest.yaml
#####################
palette-user-id = "kenneth.heaslip@spectrocloud.com"
