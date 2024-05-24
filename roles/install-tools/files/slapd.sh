#!/bin/bash

installnoninteractive(){
  sudo bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $*"
}
installnoninteractive slapd