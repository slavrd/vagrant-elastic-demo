#!/usr/bin/env bash
# Install Kibana

sudo apt-get update && sudo apt-get install -y kibana

# enable Kibana service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service

# clean up
sudo apt-get clean