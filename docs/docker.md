## Docker

To download the image, issue the following command. Change the version tag as needed.

```shell
docker pull ghcr.io/spectrocloud/tutorials:1.1.11
```

You can start the container using the following command.

```shell
docker run -p 5000:5000 --rm -it ghcr.io/spectrocloud/tutorials:1.1.11 bash
```

> The Docker file builds a Linux environment. You can use this image on a Mac and Windows. Windows users will require the usage of [WSL2](https://learn.microsoft.com/en-us/windows/wsl/about).

The Docker image includes the following tools.

| Tool                      | Description                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| `terraform`               | Infrastructure as code tool                                                                             |
| `palette cli`             | The offical Palette CLI                                                                                 |
| `spectro cli`             | Spectro Cloud command-line interface                                                                    |
| `palette edge cli`        | The Edge Installer CLU                                                                                  |
| `spectro registry server` | Spectro Cloud Registry Server                                                                           |
| `ngrok`                   | Secure tunnels to localhost                                                                             |
| `kubectl`                 | Kubernetes command-line tool                                                                            |
| `bash`                    | Unix shell                                                                                              |
| `curl`                    | Command line tool and library for transferring data with URLs                                           |
| `git`                     | Distributed version control system                                                                      |
| `openssl`                 | Toolkit for the Transport Layer Security (TLS) protocol                                                 |
| `jq`                      | Lightweight and flexible command-line JSON processor                                                    |
| `bind-tools`              | Collection of DNS utilities, including dig, nslookup, and host                                          |
| `wget`                    | Free utility for non-interactive download of files from the Web                                         |
| `nano`                    | A text editior alternative to Vi.                                                                       |
| `ca-certificates`         | Common set of CA certificates                                                                           |
| `canvos`                  | A utility for creating Edge artifacts                                                                   |
| `nano`                    | A text editior for Unix-like computing systems or operating environments using a command line interface |
| `packer`                  | Hashicorp Image Builder for building Edge Native images                                                 |
| `GOVC`                    | Tool for interracting with VMware Vsphere via API                                                       |
| `aws-cli`                 | AWS command-line interface                                                                              |
| `oras`                    | Tool for pushing and pulling OCI artifacts to and from OCI registries                                   |
| `podman`                  | Tool for building and deploying OCI images                                                              |
| `k9s`                     | Tool that provides a terminal UI to interact with your Kubernetes clusters                              |

### Spectro Cloud Pack Registry Server

The Spectro Cloud registry server has the following credentials:

- `username`: `admin`

- `password`: `admin`

You can start the registry server by issuing the command below.
Keep in mind that the registry server is started in HTTP mode. For additional guidance, review the [Registry Server documentation](https://docs.spectrocloud.com/registries-and-packs/adding-a-custom-registry).

```shell
registry serve /etc/spectro/config.yml > /var/log/registry.log 2>&1 &
```

# Local Builds

If you want to build the docker image locally, you must provide the build arguments for `PALETTE_VERSION`, `PALETTE_CLI_VERSION`, `PALETTE_EDGE_VERSION`, `PACKER_VERSION`, `ORAS_VERSION`, `TERRAFORM_VERSION`, and `K9S_VERSION`. Use the following command to build a local image and replace the versions as needed.

```shell
docker build --build-arg PALETTE_VERSION=4.5.0 --build-arg PALETTE_CLI_VERSION=4.5.0  --build-arg PALETTE_EDGE_VERSION=4.5.3 --build-arg PACKER_VERSION=1.11.0 --build-arg ORAS_VERSION=1.0.0 --build-arg PALETTE_REGISTRY_CLI_VERSION=4.5.0 --build-arg TERRAFORM_VERSION=1.9.0 --build-arg K9S_VERSION=0.32.5 -t tutorials .
```
