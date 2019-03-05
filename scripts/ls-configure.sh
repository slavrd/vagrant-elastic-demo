#!/usr/bin/env bash
# Copies Logstash configurations

sudo cp -r /tmp/logstash_tmp_conig/* /etc/logstash/.

# restart Elasticsearch
sudo /bin/systemctl restart logstash.service

# clean up
rm -rf /tmp/logstash_tmp_conig