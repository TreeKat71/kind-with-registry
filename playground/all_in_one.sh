curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kind
mv kind /usr/bin/
mv kubectl /usr/bin/
git clone https://github.com/TreeKat71/sandbox-k8s-with-kind.git
sh sandbox-k8s-with-kind/gen_config.sh \
    $(ip -br addr show|grep ens3 |awk '{print $3}'|cut -d/ -f1) \
    30600 30699 > config.yaml
kind create cluster --config=config.yaml
mkdir -p $HOME/.kube
kind get kubeconfig > $HOME/.kube/config
