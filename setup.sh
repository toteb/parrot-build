#!/bin/bash

# request sudo before everything else
sudo -v
user=$(whoami)
# Get rid of EXTERNALLY-MANAGED Environment file.
if [ -f /usr/lib/python3.11/EXTERNALLY-MANAGED ]; then sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old; fi

# 1. Install Ansible
if command -v ansible >/dev/null 2>&1; then
  echo "Ansible is already installed."
else
  echo "Ansible is not installed. Installing Ansible..."
  python3 -m pip install ansible
fi
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