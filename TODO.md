- Vagrant
 - http_proxy needs to be conditional and added to Vagrantfile as well
   - chef.http_proxy = "http://$HOST:$PORT"
   - chef.https_proxy = "http://$HOST:$PORT"

- Source
 - Add initial build infrastructure (make(1) and the likes)
 - Add an example project as starting point
