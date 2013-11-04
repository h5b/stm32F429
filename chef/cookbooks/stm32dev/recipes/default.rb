cache_path  = Chef::Config[:file_cache_path]

Chef::Log.info("[Adding Basic Development Packages]")
[
  "build-essential",
  "git-core",
  "vim",
].each do |p|
  package p
end

Chef::Log.info("[Adding STM32 Toolchain Packages]")
[
  "gcc-arm-none-eabi",
  "libftdi-dev",
  "libusb-1.0-0-dev",
].each do |p|
  package p
end

Chef::Log.info("[Building/Installing latest OpenOCD]")
remote_file File.join(cache_path, "openocd-#{node[:openocd][:version]}.tar.gz") do
  source "#{node[:openocd][:mirror]}#{node[:openocd][:version]}/openocd-#{node[:openocd][:version]}.tar.gz"
  notifies :run, "bash[install_openocd]", :immediately
end

bash "install_openocd" do
  user "root"
  cwd cache_path
  code <<-EOH
    tar xfz openocd-#{node[:openocd][:version]}.tar.gz
    cd openocd-#{node[:openocd][:version]}
    ./configure --prefix=/usr/local --enable-ft2232_libftdi --enable-stlink --enable-ftdi
    make && make install
    EOH
end

Chef::Log.info("[Adding udev Rule for ST-Link/V2 Programmer]")
template "/etc/udev/rules.d/30-ftdi-JTAG.rules" do
  source "30-ftdi-JTAG.rules"
  mode "0644"
  owner "root"
  group "root"
end

Chef::Log.info("[Adding User 'vagrant' to group 'dialout']")
group "dialout" do
  action :modify
  members "vagrant"
  append true
end
