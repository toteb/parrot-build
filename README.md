** Make sure to pip install ansible, apt has an older copy **

# Instructions
* Start with latest Kali Edition

## Automated way
* Make sure we have a sudo token (sudo whoami)
* Download setup.sh
* chmod + x setup.sh 
* Run ./setup.sh

## Manual
* Install Ansible (python3 -m pip install ansible)
* Add ansible binary to path: (export PATH=$PATH:/home/user/.local/bin)
* Clone and enter the repo (git clone)
* ansible-galaxy install -r requirements.yml
* Make sure we have a sudo token (sudo whoami)
* ansible-playbook main.yml
* Enjoy