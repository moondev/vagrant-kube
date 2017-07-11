#!/bin/bash

echo "
Attempting to remove cluster if it exists...
"
sleep2

vagrant destroy -f
rm -rf .vagrant

echo "
Starting cluster via vagrant...
"
sleep 2

vagrant up

echo "
Adding context to kubectl...
"

sleep 2

kubectl config set-cluster vagrant-kube --server=http://192.168.33.33:8080
kubectl config set-context vagrant-kube --cluster=vagrant-kube
kubectl config use-context vagrant-kube

echo "
Testing kubectl...
"
sleep 2

kubectl get pods --all-namespaces

echo "
Launching Dashboard...
"
sleep 2

open http://192.168.33.33:8080/ui