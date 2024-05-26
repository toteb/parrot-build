#!/bin/bash
user=$(whoami)
# 1. Install Ansible
python3 -m pip install ansible
# 2. Add Ansible to PATH
export PATH=$PATH:/home/$(cat $user)/.local/bin
# 3. Download kali-built repository to a specified folder
GIT_OUTPUT_DIR="/home/$user/parrot-built"
git clone https://github.com/toteb/parrot-build.git "$GIT_OUTPUT_DIR"
# 4. Install Ansible roles
ansible-galaxy install -r "$GIT_OUTPUT_DIR/requirements.yml"
# 5. Execute Ansible playbook
ansible-playbook "$GIT_OUTPUT_DIR/main.yml"
# Enjoy