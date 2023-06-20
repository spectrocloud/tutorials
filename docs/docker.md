## Docker

To download the image issue the following commnad. Change the version tag as needed.

```shell
docker pull ghcr.io/spectrocloud/tutorials:1.0.2
```

You can start the container using the following command.

```shell
docker run -p 5000:5000 --rm -it ghcr.io/spectrocloud/tutorials:1.0.2 bash
```


> The Docker file is build for a Linux environment. You can use this on a Mac and Windows. Windows users will require the usage of WSL2.


The Docker image includes the following tools.

| Tool          | Description                                                    |
|---------------|----------------------------------------------------------------|
| `terraform`   | Infrastructure as code tool                                    |
| `palette cli` | The offical Palette CLI                                        | 
| `spectro cli` | Spectro Cloud command-line interface                           |
| `palette edge cli`| The Edge Installer CLU                                     |
| `spectro registry server` | Spectro Cloud Registry Server                      |
| `ngrok`       | Secure tunnels to localhost                                    |
| `kubectl`     | Kubernetes command-line tool                                   |
| `bash`        | Unix shell                                                     |
| `curl`        | Command line tool and library for transferring data with URLs  |
| `git`         | Distributed version control system                             |
| `openssl`     | Toolkit for the Transport Layer Security (TLS) protocol        |
| `jq`          | Lightweight and flexible command-line JSON processor           |
| `bind-tools`  | Collection of DNS utilities, including dig, nslookup, and host |
| `wget`        | Free utility for non-interactive download of files from the Web|
| `nano`        | A text editior alternative to Vi.                              |
| `ca-certificates` | Common set of CA certificates                              |
| `canvos`      | A utility for creating Edge artifacts                          |
| `nano`        | A text editior for Unix-like computing systems or operating environments using a command line interface|

### Spectro Cloud Pack Registry Server

The Spectro Cloud registry server has the following credentials:

- `username`: `admin`

- `password`: `admin`

You can start the registry server by issuing the following command. 
Keep in mind that the registry server is started in HTTP mode. For additional guidance, review the [Registry Server documentation](https://docs.spectrocloud.com/registries-and-packs/adding-a-custom-registry).

```shell
registry serve /etc/spectro/config.yml > /var/log/registry.log 2>&1 &
```


# Local Builds

If you are wanting to build the docker image locally you must provide the the build arguments for `PALETTE_VERSION` and `PALETTE_CLI_VERSION`, `PALETTE_EDGE_VERSION`.  Use the following command to build a local image. Replace the versions as needed.


```shell
make build-docker VERSION=3.4.0 EDGE=3.4.3
```

OR

```shell
docker build --build-arg PALETTE_VERSION=3.3.0 --build-arg PALETTE_CLI_VERSION=3.3.0  --build-arg PALETTE_EDGE_VERSION=3.4.3 -t tutorials .
```

