#!/usr/bin/env bash
# Installs basic common packages

PKGS=("vim" "curl")

which ${PKGS[*]} >>/dev/null || {
    sudo apt-get update
    sudo apt-get install -y ${PKGS[*]} 
}

sudo apt-get clean
