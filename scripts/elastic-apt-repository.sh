#!/usr/bin/env bash
# Add elastic repository to apt

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a '/etc/apt/sources.list.d/elastic-6.x.list'
