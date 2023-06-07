#!/bin/bash

# Install Git and Ansible
apt-get update
apt-get install -y git ansible

# Install PiVPN
curl -L https://install.pivpn.io | bash

# Install PiHole
curl -sSL https://install.pi-hole.net | bash

# Install Docker (if not already installed)
if ! command -v docker &> /dev/null; then
    curl -sSL https://get.docker.com | sh
    sudo usermod -aG docker pi
fi

# Install Portainer
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# Run the ansible playbook
ansible-playbook main.yml --ask-become-pass


echo "Installazione completata!"
