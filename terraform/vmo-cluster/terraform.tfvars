# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

#####################
# Palette Settings
#####################
palette-project = "Default" # The name of your project in Palette.

############################
# MAAS Deployment Settings
############################
deploy-maas    = false # Set to true to deploy to MAAS.
deploy-maas-vm = false # Set to true to create a VM on MAAS cluster once deployed.

pcg-name    = "REPLACE ME" # Provide the name of the PCG that will be used to deploy the Palette cluster.
maas-domain = "REPLACE ME" # Provide the MAAS domain that will be used to deploy the Palette cluster.

maas-worker-nodes         = 1              # Provide the number of worker nodes that will be used for the Palette cluster.
maas-worker-resource-pool = "REPLACE ME"   # Provide a resource pool for the worker nodes.
maas-worker-azs           = ["REPLACE ME"] # Provide a set of availability zones for the worker nodes.
maas-worker-node-tags     = ["REPLACE ME"] # Provide a set of node tags for the worker nodes.

maas-control-plane-nodes         = 1              # Provide the number of control plane nodes that will be used for the Palette cluster.
maas-control-plane-resource-pool = "REPLACE ME"   # Provide a resource pool for the control plane nodes.
maas-control-plane-azs           = ["REPLACE ME"] # Provide a set of availability zones for the control plane nodes.
maas-control-plane-node-tags     = ["REPLACE ME"] # Provide a set of node tags for the control plane nodes.
