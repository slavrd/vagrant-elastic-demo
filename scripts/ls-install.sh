#!/usr/bin/env bash
# Installs Logstash

# install Logstash
sudo apt-get update && sudo apt-get install -y logstash

# enable Logstash service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable logstash.service

# clean up
sudo apt-get clean
