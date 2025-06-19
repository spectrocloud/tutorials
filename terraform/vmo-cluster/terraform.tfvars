# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

#####################
# Palette Settings
#####################
palette-project = "REPLACE_ME" # The name of your project in Palette.
palette-user-id = "REPLACE_ME" # Your Palette user ID

############################
# MAAS Deployment Settings
############################

deploy-maas                      = false          # Set to true to deploy a new VMO cluster to MAAS.
deploy-maas-vm                   = false          # Set to true to create a VM on the MAAS VMO cluster once deployed.
pcg-name                         = "REPLACE_ME"   # Provide the name of the PCG that will be used to deploy the Palette cluster.
maas-domain                      = "REPLACE_ME"   # Provide the MAAS domain that will be used to deploy the Palette cluster.
maas-control-plane-resource-pool = "REPLACE_ME"   # Provide a resource pool for the control plane nodes.
maas-control-plane-azs           = ["REPLACE_ME"] # Provide a set of availability zones for the control plane nodes.
maas-control-plane-node-tags     = ["REPLACE_ME"] # Provide a set of node tags for the control plane nodes.
maas-control-node-min-cpu        = 8     # Minimum number of CPU cores required for control plane nodes.
maas-control-node-min-memory-mb  = 32768     # Minimum amount of RAM (memory) required for control plane nodes.
maas-worker-resource-pool        = "REPLACE_ME"   # Provide a resource pool for the worker nodes.
maas-worker-azs                  = ["REPLACE_ME"] # Provide a set of availability zones for the worker nodes.
maas-worker-node-tags            = ["REPLACE_ME"] # Provide a set of node tags for the worker nodes.
maas-worker-node-min-cpu         = 8     # Minimum number of CPU cores required for worker nodes.
maas-worker-node-min-memory-mb   = 32768     # Minimum amount of RAM (memory) required for worker nodes

###############################
# manifests/metallb-values.yaml
###############################
metallb-ip-pool = "REPLACE_ME" # IP addresses to be assigned for use by MetalLB. For example, 192.168.0.1-192.168.0.4.

###############################
# manifests/ubuntu-values.yaml
###############################
node-network = "REPLACE_ME" # IP addresses to be assigned for use by the Ubuntu Kubelet services.

#####################
# virtual_machines.tf - we recommend leaving these values as is to avoid issues with other resource requirements.
#####################
vm-deploy-namespace = "virtual-machines" # Namespace where your VM will be deployed.
vm-storage-Gi       = "50Gi"             # Size of the disk (PVC) that your VM will have. Leave this value at 50Gi.
vm-cpu-cores        = 2                  # The number of CPU cores your VM will have.
vm-cpu-sockets      = 1                  # The umber of physical CPU sockets the CPU cores should be spread over.
vm-cpu-threads      = 1                  # The umber of CPU threads to use for the VM CPU.
vm-memory-Gi        = "4Gi"              # The amount of RAM (memory) your VM will have.


#####################
# vmo-values.tf
####################
vmo-network-interface = "br0" # The name of the host network interface VMO will use. Default is 'br0'
vm-vlans              = "1"   # VLANs your VMs must be able to communicate on. Default is "1" which is `untagged`.
host-vlans            = "1"   # VLANs your VMO host needs to communicate on. Default is "1" which is `untagged`.
