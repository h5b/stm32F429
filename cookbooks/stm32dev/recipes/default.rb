Chef::Log.info("[Adding Basic Development Packages]")
[
  "build-essential",
  "git-core",
  "vim",
].each do |p|
  package p
end
