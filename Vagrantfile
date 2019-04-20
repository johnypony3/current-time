Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8043

  config.vm.provision "shell", inline: "echo '192.168.9.101 chef.theemm.com' >> /etc/hosts"

  config.vm.provision "chef_client" do |chef|
    chef.chef_server_url = "https://chef.theemm.com:8043/organizations/emm"
    chef.validation_key_path = "/Users/edward/.chef/emm-validator.pem"
    chef.add_recipe "chef-client"
    chef.delete_node = true
    chef.delete_client = true
  end
end
