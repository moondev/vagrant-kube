Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  # config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
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