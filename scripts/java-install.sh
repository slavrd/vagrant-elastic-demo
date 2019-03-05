#!/usr/bin/env bash
# Install Java

which java >>/dev/null || {
    sudo apt-get update
    sudo apt-get install -y openjdk-8-jdk
}
