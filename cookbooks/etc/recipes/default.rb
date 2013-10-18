Chef::Log.info("[Customising files in /etc]")
template "/etc/motd.tail" do
  source "motd.tail"
  mode "0644"
  owner "root"
  group "root"
end
