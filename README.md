# vagrant-kube

This project launches a local kubernetes cluster using only virtualbox and vagrant

## Requirements

### Virtualbox
Download installer from https://www.virtualbox.org/wiki/Downloads

### Vagrant
Download installer from https://www.vagrantup.com/downloads.html

### Kubectl
Instructions here https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-via-curl

## How to use

Clone this repo and enter directory

```
git clone ssh://git@stash.dev-charter.net:7999/~cmoon/vagrant-kube.git
cd vagrant-kube
```

### Start a cluster
```
./start-cluster.sh
```

Watch feedback on screen and dashboard will eventually launch at `http://192.168.33.33:8080/ui`

The script also automatically configures and sets `kubectl` to use the `vagrant-kube` context

### Suspend cluster

If you want to stop a cluster but quickly bring it back up in it's current state for later use.
```
vagrant suspend
```

bring it back up

```
vagrant resume
```

### Delete cluster

```
vagrant destroy
```