Chef::Log.info("[Adding Repository >>gcc-arm-embedded<<]")
apt_repository "gcc-arm-embedded" do
  uri "http://ppa.launchpad.net/terry.guo/gcc-arm-embedded/ubuntu/"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "6D1D8367A3421AFB"
  action :add
end

Chef::Log.info("[Customising files in /etc]")
template "/etc/motd.tail" do
  source "motd.tail"
  mode "0644"
  owner "root"
  group "root"
end
