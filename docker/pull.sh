#!/bin/bash

docker pull gcr.io/google_containers/kube-proxy-amd64:v1.7.0
docker pull gcr.io/google_containers/kube-apiserver-amd64:v1.7.0
docker pull gcr.io/google_containers/kube-controller-manager-amd64:v1.7.0
docker pull gcr.io/google_containers/kube-scheduler-amd64:v1.7.0
docker pull weaveworks/weave-npc:2.0.1
docker pull weaveworks/weave-kube:2.0.1
docker pull gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.4
docker pull gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.4
docker pull gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.4
docker pull gcr.io/google_containers/kubernetes-dashboard-amd64:v1.6.1
docker pull gcr.io/google_containers/etcd-amd64:3.0.17
docker pull gcr.io/google_containers/pause-amd64:3.0