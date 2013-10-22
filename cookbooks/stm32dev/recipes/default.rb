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

