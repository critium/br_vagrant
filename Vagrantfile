# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.provision :shell, :inline => "echo Hello"
	config.vm.box = "precise32"

	config.vm.define :web1 do |web1|
		config.vm.provision :shell, :path => "bootstrap.sh"
		config.vm.network :forwarded_port, host: 19000, guest: 9000
		config.vm.network :private_network, ip: "10.0.0.1"
		#config.vm.synced_folder ".", "/vagrant", :nfs => true
	end

	config.vm.define :web2 do |web2|
		config.vm.provision :shell, :path => "bootstrap.sh"
		config.vm.network :forwarded_port, host: 19001, guest: 9000
		config.vm.network :private_network, ip: "10.0.0.2"
		#config.vm.synced_folder ".", "/vagrant", :nfs => true
	end

end
