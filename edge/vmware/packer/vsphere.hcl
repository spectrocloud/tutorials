# Virtual Machine Settings
########### DO NOT EDIT #################
# VM Template Name
vm_name          = "palette-edge-template"

# VM Settings
vm_guest_os_type        = "ubuntu64Guest"
vm_version              = 14
vm_firmware             = "bios"
vm_cdrom_type           = "sata"
vm_cpu_sockets          = 4
vm_cpu_cores            = 1
vm_mem_size             = 8192
vm_disk_size            = 102400
thin_provision          = true
disk_eagerly_scrub      = false
vm_disk_controller_type = ["pvscsi"]
vm_network_card         = "vmxnet3"
vm_boot_wait            = "5s"


# ISO Objects

iso                 = "build/palette-edge-installer.iso"
iso_checksum        = "build/palette-edge-installer.iso.sha256"
