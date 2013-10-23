- Vagrant
 - http_proxy needs to be condtional and added to Vagrantfile as well
   - chef.http_proxy = "http://$HOST:$PORT"
   - chef.https_proxy = "http://$HOST:$PORT"

- cookbooks/stm32dev/recipes/default.rb
  - use Chef::Config[:file_cache_path] instead of "/tmp" directory
  - move "configure flags" to "../attributes/default.rb"
  - move "--prefix" to "../attributes/default.rb"

- README.md
 - Add Image of the STM32F429

- Source
 - Add initial build infrastructure (Make and the likes)
 - Add an example project as a starting point
