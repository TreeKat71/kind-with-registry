## Download kubectl

```bash
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Then move it to the $PATH
```

## Download kind binary
```bash
$ curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64

$ chmod +x ./kind

# Then move it to the $PATH
```

## Create kubernetes cluster
### Edit config.yaml
```bash
networking:
  apiServerAddress: "10.88.33.144"  <- replace it with your IP
  apiServerPort: 6444
```

1. only kubernetes cluster
```bash
$ kind create cluster --config=config.yaml
```

2. kubernetes cluster with registry
```bash
$ sh kind-with-registry.sh
```

## How to use
1. If you want to use this cluster remotely, then copy the content of config under ~/.kube and fill them to your ~/.kube/config
2. The NodePort service will be lauched from port 30600~30699, you can adjust the port range on your own if needed.

Feel free to ask any questions
