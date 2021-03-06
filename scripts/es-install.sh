#!/usr/bin/env bash

# install Elasticsearch
sudo apt-get update && sudo apt-get install -y elasticsearch=6.6.1

# enable elastic search service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

# clean up
sudo apt-get clean
