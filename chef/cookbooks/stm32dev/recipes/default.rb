cache_path  = Chef::Config[:file_cache_path]

Chef::Log.info("[Adding: Basic Packages]")
[
  "build-essential",
  "git-core",
  "libtool",
  "pkg-config",
  "vim",
].each do |p|
  package p
end

Chef::Log.info("[Adding: STM32 Toolchain Packages]")
[
  "gcc-arm-none-eabi",
  "libftdi-dev",
  "libusb-1.0-0-dev",
  "python-yaml",
].each do |p|
  package p
end

Chef::Log.info("[Installing: latest OpenOCD Release]")
remote_file File.join(cache_path, "openocd-#{node[:openocd][:version]}.tar.gz") do
  source "#{node[:openocd][:mirror]}#{node[:openocd][:version]}/openocd-#{node[:openocd][:version]}.tar.gz"
  notifies :run, "bash[install_openocd]", :immediately
end

configure_flags = node[:openocd][:configure_flags].join(" ")

bash "install_openocd" do
  user "root"
  cwd cache_path
  code <<-EOH
    tar xfz openocd-#{node[:openocd][:version]}.tar.gz
    cd openocd-#{node[:openocd][:version]}
    ./configure #{configure_flags}
    make && make install
    EOH
end

Chef::Log.info("[Adding: User 'vagrant' to group 'dialout']")
group "dialout" do
  action :modify
  members "vagrant"
  append true
end
