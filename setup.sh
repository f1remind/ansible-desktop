#!/bin/bash
# Install requirements
sudo apt update
sudo apt install -y python3-pip git

# Install ansible and make it accessible
python3 -m pip install --user ansible
grep -qxF 'PATH=$PATH:~/.local/bin' ~/.bashrc || echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc

# Enable argcomplete
python3 -m pip install --user argcomplete
activate-global-python-argcomplete --user
source ~/.bashrc

# Install roles
#ansible-galaxy install gantsign.visual-studio-code
ansible-galaxy install -r requirements.yml

# Run ansible!
ansible-playbook playbook.yaml

