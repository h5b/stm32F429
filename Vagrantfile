# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.hostname = "stm32-dev"
  config.vm.provider "virtualbox" do |v|
    v.name = "stm32-dev"
    # Enable USB Support with EHCI
    v.customize ['modifyvm', :id, '--usb', 'on']
    v.customize ['modifyvm', :id, '--usbehci', 'on']
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "proxy"
    chef.add_recipe "apt"
    chef.add_recipe "etc"
    chef.add_recipe "stm32dev"
  end

end
