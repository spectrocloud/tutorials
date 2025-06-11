
##########################
# MAAS Virtual Machine
##########################
resource "spectrocloud_virtual_machine" "virtual-machine" {
  count      = var.deploy-maas-vm ? 1 : 0
  depends_on = [spectrocloud_cluster_maas.maas-cluster]

  cluster_uid     = data.spectrocloud_cluster.maas_vmo_cluster[0].id
  cluster_context = data.spectrocloud_cluster.maas_vmo_cluster[0].context

  #run_on_launch = true
  run_strategy = "Halted"
  namespace    = var.vm-deploy-namespace
  name         = var.vm-deploy-name

  timeouts {
    create = "60m"
  }

  labels = {
    #var.vm-labels
    # "tf"             = "spectrocloud-tutorials"
    "kubevirt.io/vm" = "ubuntu-2204"
  }

  data_volume_templates {
    metadata {
      name      = "ubuntu-2204"
      namespace = var.vm-deploy-namespace
    }
    spec {
      source {
        pvc {
          name      = "template-ubuntu-2204"
          namespace = "vmo-golden-images"
        }
      }
      pvc {
        access_modes = ["ReadWriteMany"]
        resources {
          requests = {
            storage = var.vm-storage-Gi
          }
        }
        storage_class_name = "ceph-block"
        volume_mode        = "Block"
      }
    }
  }

  volume {
    name = "ubuntu-2204"
    volume_source {
      data_volume {
        name = "ubuntu-2204"
      }
    }
  }

  volume {
    name = "cloudinitdisk"
    volume_source {
      cloud_init_no_cloud {
        user_data = file("virtual-machines/cloud-init")
      }
    }
  }

  disk {
    name = "ubuntu-2204"
    disk_device {
      disk {
        bus = "virtio"
      }
    }
  }
  disk {
    name = "cloudinitdisk"
    disk_device {
      disk {
        bus = "virtio"
      }
    }
  }

  cpu {
    cores   = var.vm-cpu-cores
    sockets = var.vm-cpu-sockets
    threads = var.vm-cpu-threads
  }
  memory {
    guest = var.vm-memory-Gi
  }

  resources {}

  interface {
    name                     = "default"
    interface_binding_method = "InterfaceMasquerade"
  }

  network {
    name = "default"
    network_source {
      pod {}
    }
  }
}
