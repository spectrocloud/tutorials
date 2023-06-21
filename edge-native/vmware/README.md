# Overview
This directory contains the following files and folders. These files are referred to in the [Deploy an Edge Cluster on VMware](https://docs.spectrocloud.com/clusters/edge/deploy-cluster) tutorial. 

```bash
.
└── vmware
    ├── README.md
    ├── clone_vm_template
    │   ├── delete-edge-host.sh
    │   ├── deploy-edge-host.sh
    │   └── setenv.sh
    └── packer
        ├── build.pkr.hcl
        ├── meta-data
        ├── user-data
        └── vsphere.hcl
```


The **vmware/packer/** folder contains the Packer code responsible for creating a VM template in VMWare vCenter from the Edge installer ISO image. Here is a brief description of files present in this folder:

- **build.pkr.hcl** is the Packer build script. 

- **vsphere.hcl** defines the VM template name, VM configuration, and ISO file name to use. The VM configuration conforms to the [minimum device requirements](https://docs.spectrocloud.com/clusters/edge/architecture/#minimumdevicerequirements).

- **meta-data** and **user-data** are sample template files. These file are optional for the build process.


The **vmware/clone_vm_template** folder contains the shell scripts containing GOVC command line instructions. Here is a brief description of the files present in this folder:

- **delete-edge-host.sh** provisions the VMs

- **deploy-edge-host.sh** deletes the VMs.

- **setenv.sh** defines the GOVC environment variables, the number of VMs, a prefix string for the VM name, and the VM template name. 

# Dependencies
Your environment must have Packer and GOVC installed. 

To install Packer, refer to these official [instructions](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli). 

To install GOVC, you must first install Go using the following instructions:
```bash
wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
```
After installing Go, you can install [GOVC CLI utility](https://github.com/vmware/govmomi/tree/main/govc) and `xorriso` dependency as:
```bash
curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" | tar -C /usr/local/bin -xvzf - govc
sudo apt-get install -y xorriso
```


# Prerequisites
To use the Packer and GOVC files, you need the following VMWare permissions:

```bash
Datastore.AllocateSpace
Host.Config.AdvancedConfig
Host.Config.NetService
Host.Config.Network
Network.Assign
System.Anonymous
System.Read
System.View
VApp.Import
VirtualMachine.Config.AddNewDisk
VirtualMachine.Config.AdvancedConfig
```

You will need the VMWare vCenter server URL, login credentials, and names of the data center, destination datastore, resource pool, destination folder (not on Datastore, on the vSphere logical view), cluster, and DHCP enabled network to be assigned to the VM template.


Refer to the [Deploy an Edge Cluster on VMware](https://docs.spectrocloud.com/clusters/edge/deploy-cluster) tutorial to learn how to use Packer and GOVC files present in this folder. 