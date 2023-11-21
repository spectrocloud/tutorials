#!/bin/bash

source /edge/vmware/clone_vm_template/setenv.sh

# First, list directories to confirm access and credentials
govc datastore.ls -ds=$vcenter_datastore
if [ $? -ne 0 ]; then
    echo "Error accessing datastore."
    exit 1
fi

# Now, try to list the packer_cache directory
govc datastore.ls -ds=$vcenter_datastore /packer_cache
if [ $? -ne 0 ]; then
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