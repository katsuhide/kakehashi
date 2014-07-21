# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Encoding.default_external = 'UTF-8'
  config.vm.box = "centos65-x86_64"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.hostname = "kakehashi"

  config.vm.provider "virtualbox" do |v|
    v.customize [
      'modifyvm', :id,
      '--memory', [ENV['KAKEHASHI_VM_MEM'].to_i, 2048].max,
      '--cpus', [ENV['KAKEHASHI_VM_CPUS'].to_i, 1].max
    ]
  end

  config.vm.network :private_network, ip: "10.10.10.10"

  config.vm.provision :shell, :path => "config/provision/server.sh"
  config.vm.provision :shell, :inline => <<-CMD
    su -c 'bash -lx /vagrant/config/provision/application.sh' vagrant
    echo
    echo '### Next action ###'
    echo '$ cd ~/ && git clone git@github.com:katsuhide/kakehashi.git or your forked repo'
    echo '$ cd kakehashi'
    echo '$ git config user.name 'Your name''
    echo '$ git config user.email 'your.address@example.com'"'
    echo
  CMD
end
