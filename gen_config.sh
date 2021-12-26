IP=$1
NODEPORT_START="${2:-30000}"
NODEPORT_END="${3:-32767}"
WORKER_NUM="${WORKER_NUM:-1}"

cat  << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
kubeadmConfigPatches:
  - |
    kind: ClusterConfiguration
    apiServer:
      extraArgs:
        "service-node-port-range": "$NODEPORT_START-$NODEPORT_END"
networking:
  apiServerAddress: "$IP"
  apiServerPort: 6444
nodes:
  - role: control-plane
    extraPortMappings:
EOF

for port in $(seq $NODEPORT_START $NODEPORT_END)
do
cat  << EOF
      - containerPort: $port
        hostPort: $port
        listenAddress: "$IP"
EOF
done

for port in $(seq 1 $WORKER_NUM)
do
cat  << EOF
  - role: worker
EOF
done
