# Steps

1. Install `kind`
2. Create cluster with config
    - generate `config.yaml`
    - create kubernetes cluster
3. Get kind cluster credential
4. Set kind cluster credential
5. (optional) Install kubectl

## Install kind
```bash
$ curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64

$ chmod +x ./kind

# Move it to your $PATH such as /usr/local/bin
```

## Create kubernetes cluster
### Generate config.yaml
```bash
# Ask your network administrator which IP you should use
$ sh gen_config.sh <IP> [nodePort_start] [nodePort_end] > config.yaml
```

The default range of `NodePort` service will be lauched from port 30000~32767, you can adjust the port range on your own if needed.

### Create kubernetes cluster
```bash
$ kind create cluster --config=config.yaml
```


## Get kind cluster credential
```bash
$ kind get kubeconfig > config_kind
```

## Set kind cluster credential
Assume that you would like to access kind cluster remotely. 

Then you have two options:

A><br>Fill what you got from `$ kind get kubeconfig` in your local ~/.kube/config.


B><br>To save your time, follow steps in this repo
[kubeconfig_merge](https://github.com/TreeKat71/kubeconfig_merge). Then you just need to move the `config_kind`, generated from previous step, under your local ~/.kube.

```bash
(local) $ scp host_kind:/path/to/config_kind  ~/.kube/
```


## (optional) Install kubectl
```bash
(local) $ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Move it to your $PATH such as /usr/local/bin
```

---

Found mistakes?
------------


Feel free to contact me through
[email](mailto:muller79924@gmail.com)
in english or chinese.
