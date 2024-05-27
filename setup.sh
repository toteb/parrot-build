#!/bin/bash
user=$(whoami)
# 1. Install Ansible
python3 -m pip install ansible
# 2. Add Ansible to PATH
export PATH=$PATH:/home/$user/.local/bin
# 3. Download kali-built repository to a specified folder
GIT_OUTPUT_DIR="/home/$user/parrot-build"
if [ -d "$GIT_OUTPUT_DIR" ]; then
  echo "Directory $DIR exists. Deleting it first"
  rm -rf "$GIT_OUTPUT_DIR"
  echo "Directory $GIT_OUTPUT_DIR deleted."
else
  echo "Directory $GIT_OUTPUT_DIR does not exist, script will continue."
fi
git clone https://github.com/toteb/parrot-build.git "$GIT_OUTPUT_DIR"
# 4. Install Ansible roles
ansible-galaxy install -r "$GIT_OUTPUT_DIR/requirements.yml"
# 5. Execute Ansible playbook
ansible-playbook "$GIT_OUTPUT_DIR/main.yml"
# Enjoy