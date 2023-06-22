
resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.tags
  cloud       = "edge-native"             # Possible values: "aws", "azure", "gcp", "edge-native" 
  type        = "cluster"                 # Possible values: "cluster", "add-on"

  ############################
  # Core layers
  ############################
  # Packs below have a static name and tag value. Refer to the HubbleAPI collection before changing these value.
  pack {
    name    = "edge-native-byoi"
    tag     = "1.0.0"
    uid     = data.spectrocloud_pack.edge-native-byoi.id
    values    = "pack:\n  content:\n    images:\n      - image: \"{{.spectro.pack.edge-native-byoi.options.system.uri}}\"\noptions:\n  system.uri: \"{{ .spectro.pack.edge-native-byoi.options.system.registry }}/{{ .spectro.pack.edge-native-byoi.options.system.repo }}:{{ .spectro.pack.edge-native-byoi.options.system.k8sDistribution }}-{{ .spectro.system.kubernetes.version }}-{{ .spectro.pack.edge-native-byoi.options.system.peVersion }}-{{ .spectro.pack.edge-native-byoi.options.system.customTag }}\"\n  system.registry: ttl.sh\n  system.repo: ubuntu\n  system.k8sDistribution: k3s\n  system.osName: ubuntu\n  system.peVersion: v3.4.3\n  system.customTag: demo\n  system.osVersion: 22"
  }

  pack {
    name    = "edge-k3s"
    tag     = "1.25.x"
    uid     = data.spectrocloud_pack.edge-k3s.id
    values  = data.spectrocloud_pack.edge-k3s.values
  }

  pack {
    name    = "cni-calico"
    tag     = "3.25.x"
    uid     = data.spectrocloud_pack.cni-calico.id
    values  = data.spectrocloud_pack.cni-calico.values
  }

  ############################
  # Manifest layer
  ############################
  pack {
    name = "hello-universe"
    type = "manifest"
    manifest {
      name    = "hello-universe"
      content = <<-EOT
apiVersion: v1
kind: Service
metadata:
  name: hello-universe-service
spec:
  type: NodePort
  selector:
    app: hello-universe
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-universe-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello-universe
  template:
    metadata:
      labels:
        app: hello-universe
    spec:
      containers:
      - name: hello-universe  
        image: ghcr.io/spectrocloud/hello-universe:1.0.12 
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 8080
      EOT
    }
  }
}  