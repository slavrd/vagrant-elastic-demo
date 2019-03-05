#!/usr/bin/env bash
# Installs Elastic prerequisites

# update apt cache
sudo apt-get update

# install java
sudo apt-get install -y openjdk-8-jdk

# add Elsastic repository to apt
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a '/etc/apt/sources.list.d/elastic-6.x.list'
