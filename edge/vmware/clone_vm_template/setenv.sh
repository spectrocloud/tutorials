#!/bin/bash
# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

# Number of VMs to provision
export NO_OF_VMS=3
export VM_PREFIX="demo"
export INSTALLER_TEMPLATE="palette-edge-template"

##################################################
#### DO NOT MODIFY BELOW HERE ####################
##################################################

# GOVC Properties
# vCenter Endpoint
export GOVC_URL="https://${vcenter_server}"     # Use HTTPS. For example, https://vcenter.company.com
export GOVC_USERNAME="${vcenter_username}"
export GOVC_PASSWORD="${vcenter_password}"
export GOVC_INSECURE=1 #1 if insecure
export GOVC_DATACENTER="${vcenter_datacenter}"
export GOVC_DATASTORE="${vcenter_datastore}"
export GOVC_NETWORK="${vcenter_network}"
export GOVC_RESOURCE_POOL="${vcenter_resource_pool}"
export GOVC_FOLDER="${vcenter_folder}"
