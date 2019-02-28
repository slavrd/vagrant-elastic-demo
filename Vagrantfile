require 'ipaddr'

Vagrant.configure("2") do |config|

  # Common configurations
  config.vm.box = "slavrd/xenial64"

  # Define common Elastic stack VM - logstash, es master and kibana machine
  config.vm.define "elkcommon" do |es|
    es.vm.hostname = "elkcommon"
    es.vm.network "private_network", ip: "192.168.2.100"
    es.vm.network "forwarded_port", guest: 80, host: 8090
  end

  # Define Elastic stack es data nodes
  esdatanodes = 2
  esnodes_start_ip = IPAddr.new("192.168.2.110") # Node IPs will start from the next one

  (1..esdatanodes).each do |i|

    vm_name = "esdatanode%02d" % [i]
    
    config.vm.define vm_name do |esnode|
      esnode.vm.hostname = vm_name
      esnode.vm.network "private_network", ip: esnodes_start_ip.succ.to_s
    end

  end

  # Dfine web server
  config.vm.define "web01" do |web|
    web.vm.box = "slavrd/nginx64"
    web.vm.hostname = "web01"
    web.vm.network "private_network", ip: "192.168.2.10"
    web.vm.network "forwarded_port", guest: 80, host: 8080
  end

end
