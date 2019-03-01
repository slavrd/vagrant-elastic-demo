#!/usr/bin/env bash
# Copies Elasticsearch configurations

sudo cp /tmp/elasticsearch_tmp_conig/* /etc/elasticsearch/.

# restart Elasticsearch
sudo /bin/systemctl restart elasticsearch.service

# clean up
rm -rf /tmp/elasticsearch_tmp_conig