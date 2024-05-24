#!/bin/bash

export DEBIAN_FRONTEND=noninteractive 
sudo debconf-set-selections <<< 'slapd/root_password password testpassword!'
sudo debconf-set-selections <<< 'slapd/root_password_again password testpassword!'
sudo apt-get -y install slapd ldap-utils