#!/bin/bash

source ./setenv.sh

set -o errexit
set -o nounset
set -o pipefail

vm_array=( $(seq 1 $NO_OF_VMS ) )


echo "Cleaning Previous VMs on vSphere"

for VM in ${vm_array[@]}; 
	do
		echo "Getting UUID $VM_PREFIX-$VM"
		UUID=$(govc vm.info  $VM_PREFIX-$VM | grep UUID: |  sed "s/.* //" | sed "s/-//g")
		if govc vm.destroy $VM_PREFIX-$VM #> /dev/null 2>&1 
		then
			echo "Deleted $VM_PREFIX-$VM"
		fi
done