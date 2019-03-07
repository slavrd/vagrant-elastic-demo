#!/usr/bin/env bash
# Install Filebeat

which filebeat >>/dev/null || {
    sudo apt-get update
    sudo apt-get install -y filebeat
    sudo apt-get clean
}

# enable Filebeat service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable filebeat.service
