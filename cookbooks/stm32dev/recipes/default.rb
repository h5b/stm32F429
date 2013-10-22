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

# XXX FIXME
#
# o Get rid of unsafe "/tmp" directory which isn't reboot-safe
# o Currently "Chef::Config[:file_cache_path]" seems to be undefined
#   for unknown reasons. "No such file or directory -
#   Chef::Config[:file_cache_path] (Errno::ENOENT)"
#
Chef::Log.info("[Building/Installing latest OpenOCD]")
remote_file "/tmp/openocd-#{node[:openocd][:version]}.tar.gz" do
  source "#{node[:openocd][:mirror]}#{node[:openocd][:version]}/openocd-#{node[:openocd][:version]}.tar.gz"
  notifies :run, "bash[install_openocd]", :immediately
end

bash "install_openocd" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xfz openocd-#{node[:openocd][:version]}.tar.gz
    cd openocd-#{node[:openocd][:version]}
    ./configure --prefix=/usr/local --enable-ft2232_libftdi --enable-stlink --enable-ftdi
    make && make install
    EOH
end
