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
].each do |p|
  package p
end

