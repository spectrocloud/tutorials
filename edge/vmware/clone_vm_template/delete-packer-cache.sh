#!/bin/bash
# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0


source /edge/vmware/clone_vm_template/setenv.sh

# First, list directories to confirm access and credentials
govc datastore.ls -ds=$vcenter_datastore > /dev/null
if [ $? -ne 0 ]; then
    echo "Error accessing datastore."
    exit 1
fi

# Now, try to list the packer_cache directory
PACKER_CACHE_OUTPUT=$(govc datastore.ls -ds=$vcenter_datastore /packer_cache 2>&1)
PACKER_CACHE_STATUS=$?

if [ $PACKER_CACHE_STATUS -ne 0 ]; then
    echo "Existing packer cache not found. Nothing to delete."
else
    # Cache exists, attempt to delete it
    govc datastore.rm -ds=$vcenter_datastore /packer_cache
    if [ $? -eq 0 ]; then
        echo "Deleted previous packer cache."
        exit 0
    else
        echo "Failed to delete packer cache."
        exit 1
    fi
fi