#!/usr/bin/env bash
# Setup Filebeat
# Required: 1st argument - Elasticsearch IP

sudo cp /tmp/filebeat_tmp_config/* /etc/filebeat/.

# Set filebeat index creation template in elasticsearch
filebeat setup --template -E output.logstash.enabled=false -E "output.elasticsearch.hosts=[\"$1\"]"

# configure filebeat nginx module
filebeat modules enable nginx

# restart filebeat service 
sudo /bin/systemctl restart filebeat.service

# clean-up
rm -rf /tmp/filebeat_tmp_config
