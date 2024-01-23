#!/bin/bash
# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0


source ./setenv.sh

set -o errexit
set -o nounset
set -o pipefail

vm_array=( $(seq 1 $NO_OF_VMS ) )


for VM in ${vm_array[@]}; 
	do
	if govc vm.clone -link=true -m 8000 -on=false -vm $GOVC_FOLDER/$INSTALLER_TEMPLATE $VM_PREFIX-$VM 
		then
			echo "Cloned VM $VM_PREFIX-$VM"
		else
			echo "Failed to clone VM $VM_PREFIX-$VM"
		fi

		echo "Powering on VM $VM_PREFIX-$VM"
		if ! govc vm.power -on=true  -wait=false $VM_PREFIX-$VM
		then
			echo "Failed to power on VM $VM_PREFIX-$VM"
		fi	

		echo "Getting UUID $VM_PREFIX-$VM"
		# govc vm.info got uuid with middle ending, need to convert the first 3 components
		u=$(govc vm.info  $VM_PREFIX-$VM | grep UUID: |  sed "s/.* //" | sed "s/-//g")
		UUID=${u:6:2}${u:4:2}${u:2:2}${u:0:2}${u:10:2}${u:8:2}${u:14:2}${u:12:2}${u:16}
		echo "Edge Host ID   VM $VM_PREFIX-$VM : edge-$UUID"
done

