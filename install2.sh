#!/bin/bash

sudo usermod -a -G rvm root
sudo usermod -a -G rvm kkhuong

sudo useradd -m -p $(openssl passwd -1 -salt SALT TEMP_PASSWORD) -s /bin/bash adminuser
sudo usermod -aG sudo adminuser
sudo usermod -a -G rvm adminuser

if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi
if sudo grep -q secure_path /etc/sudoers; then export rvmsudo_secure_path=1; fi

rvmsudo cleanup all
