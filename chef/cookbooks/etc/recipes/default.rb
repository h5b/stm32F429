Chef::Log.info("[Adding: ppa Repository 'gcc-arm-embedded']")
apt_repository "gcc-arm-embedded" do
  uri "http://ppa.launchpad.net/terry.guo/gcc-arm-embedded/ubuntu/"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "6D1D8367A3421AFB"
  action :add
end

Chef::Log.info("[Customising: /etc/motd]")
template "/etc/motd.tail" do
  source "motd.tail"
  mode "0644"
  owner "root"
  group "root"
  action :create_if_missing
end

Chef::Log.info("[Adding: udev Rule for ST-Link/V2 Programmer]")
template "/etc/udev/rules.d/30-ftdi-JTAG.rules" do
  source "30-ftdi-JTAG.rules"
  mode "0644"
  owner "root"
  group "root"
  action :create_if_missing
end
