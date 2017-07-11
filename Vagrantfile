Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.ssh.insert_key = true
  config.vm.network "private_network", ip: "192.168.33.33"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4000"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "shell", path: "provision.sh"

end