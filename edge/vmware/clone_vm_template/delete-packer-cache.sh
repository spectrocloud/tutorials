#!/bin/bash

source /edge/vmware/clone_vm_template/setenv.sh

# Check if the packer cache exists
CACHE_OUTPUT=$(govc datastore.ls -ds=$vcenter_datastore /packer_cache 2>&1)

if [[ $CACHE_OUTPUT == *"/packer_cache was not found"* ]]; then
  echo "Existing packer cache not found. Nothing to delete."
else
  # Cache exists, attempt to delete it
  govc datastore.rm -ds=$vcenter_datastore /packer_cache
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    echo "Deleted previous packer cache."
    exit 0
  else
    echo "Failed to delete packer cache."
    exit 1
  fi
fi