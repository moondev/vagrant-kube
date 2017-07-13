#!/bin/bash

vagrant destroy -f
vagrant up
sleep 5
rm -f instakube.box
vagrant package --vagrantfile=instakube.vagrantfile --output instakube.box
vagrant box add -f instakube instakube.box
rm -rf instakube
mkdir instakube
cp init.vagrantfile instakube/Vagrantfile
cd instakube
vagrant up