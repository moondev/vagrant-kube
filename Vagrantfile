Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.33"
  config.vm.post_up_message = "Welcome to instakube"

  config.vm.provider "virtualbox" do |vb|
    # vb.name = "instakube"
    vb.gui = false
    vb.memory = "6000"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "shell", path: "provision.sh"

end