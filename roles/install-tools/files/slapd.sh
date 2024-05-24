#!/bin/bash

export DEBIAN_FRONTEND=noninteractive 
sudo debconf-set-selections <<< 'slapd/root_password password slapdtested!'
sudo debconf-set-selections <<< 'slapd/root_password_again password slapdtested!'
sudo apt-get -y install slapd ldap-utils