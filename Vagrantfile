require 'ipaddr'
require 'ERB'

Vagrant.configure("2") do |config|

  # Variable declarations
    # general vars
  es_cluster_name = "es-cluster"

    # elasticsearch master
  es_master_name = "master-01"
  es_master_ip = "192.168.2.100"

    # elasticsearch datanodes
  es_datanodes = 2
  es_datanodes_name = "data-%02d" # template string that needs the node number
  es_datanodes_start_ip = IPAddr.new("192.168.2.110") # data node IPs will start from the next one

  # Common configurations
  config.vm.box = "slavrd/xenial64"
  config.vm.provision "shell", path: "scripts/general-install.sh"

  # Define common Elastic stack VM - logstash, elasticsearch master and kibana machine
  config.vm.define "elkcommon" do |elkcom|

    elkcom.vm.hostname = "elkcommon"
    elkcom.vm.network "private_network", ip: es_master_ip
    elkcom.vm.network "forwarded_port", guest: 80, host: 8090

    # Install Elasticseach
    elkcom.vm.provision "shell", path: "scripts/es-install.sh"

    # Configure Elasticsearch
      # copy jvm settings to guest
    elkcom.vm.provision "file", source: "configs/elasticsearch/master/jvm.options", destination: "/tmp/elasticsearch_tmp_conig/jvm.options"

      # render elasticsearch.yml from template
    esMasterConfigFile = "/tmp/elasticsearch.%s.yml" % es_master_name
    esMasterConfigTemplate = File.read("configs/elasticsearch/master/elasticsearch.yml.erb")
    File.write(esMasterConfigFile, ERB.new(esMasterConfigTemplate).result(binding))
      # copy elasticsearch settings to guest
    elkcom.vm.provision "file", source: esMasterConfigFile, destination: "/tmp/elasticsearch_tmp_conig/elasticsearch.yml"

      # apply copied settings
    elkcom.vm.provision "shell", path: "scripts/es-configure.sh"

  end

  # Define Elasticsearch data nodes
  current_datanode_ip = es_datanodes_start_ip
  (1..es_datanodes).each do |i|

    vm_name = "esdatanode%02d" % [i]
    current_node_name = es_datanodes_name % [i]
    
    config.vm.define vm_name do |esnode|
      current_datanode_ip = current_datanode_ip.succ
      esnode.vm.hostname = vm_name
      
      esnode.vm.network "private_network", ip: current_datanode_ip.to_s

      # Install Elasticseach
      esnode.vm.provision "shell", path: "scripts/es-install.sh"

      # Configure Elasticsearch
        # copy jvm settings to guest
      esnode.vm.provision "file", source: "configs/elasticsearch/data/jvm.options", destination: "/tmp/elasticsearch_tmp_conig/jvm.options"

        # render elasticsearch.yml from template
      esDataConfigFile = "/tmp/elasticsearch.%s.yml" % current_node_name
      esDataConfigTemplate = File.read("configs/elasticsearch/data/elasticsearch.yml.erb")
      File.write(esDataConfigFile,ERB.new(esDataConfigTemplate).result(binding))
        # copy elasticsearch settings to guest
      esnode.vm.provision "file", source: esDataConfigFile, destination: "/tmp/elasticsearch_tmp_conig/elasticsearch.yml"

        # apply copied settings
      esnode.vm.provision "shell", path: "scripts/es-configure.sh"
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
