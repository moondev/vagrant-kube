#!/bin/bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y curl apt-transport-https docker.io kubelet kubeadm

kubeadm init --token=acbec6.2852dff7cb569aa0 --apiserver-advertise-address=192.168.33.33 --apiserver-cert-extra-sans=192.168.33.33

kubectl --kubeconfig=/etc/kubernetes/admin.conf taint nodes --all node-role.kubernetes.io/master-
kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f https://git.io/weave-kube-1.6
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://git.io/kube-dashboard

KUBEDNS="Pending"

echo "Waiting for kube-dns to deploy. This may take a few minutes."
sleep 5
until [ "$KUBEDNS" = "Running" ]
do
KUBEDNS=`kubectl --kubeconfig=/etc/kubernetes/admin.conf --namespace kube-system get pod -l=k8s-app=kube-dns -o jsonpath={.items..status.phase}`

echo "


























































BOOTSTRAPPING CLUSTER...
CURRENT STATUS:

"

kubectl --kubeconfig=/etc/kubernetes/admin.conf get pods --all-namespaces

sleep 2
done

kubelet.service daemon-reload
systemctl enable kubelet.service
systemctl start kubelet.service
systemctl status kubelet.service --no-pager

cat > kubectl-proxy.service <<EOF
[Unit]
Description=kubectl proxy

[Service]
ExecStart=/usr/bin/kubectl --kubeconfig=/etc/kubernetes/admin.conf proxy --disable-filter=true --api-prefix=/ --address=0.0.0.0 --port 8080
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

mv kubectl-proxy.service /etc/systemd/system/
kubectl-proxy.service daemon-reload
systemctl enable kubectl-proxy.service
systemctl start kubectl-proxy.service
systemctl status kubectl-proxy.service --no-pager

kubectl --kubeconfig=/etc/kubernetes/admin.conf get pods --all-namespaces
kubectl --kubeconfig=/etc/kubernetes/admin.conf cluster-info