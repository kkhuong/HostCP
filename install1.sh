#!/bin/bash

# sudo useradd -m -p $(openssl passwd -1 -salt SALT TEMP_PASSWORD) -s /bin/bash kkhuong
# sudo usermod -aG sudo kkhuong
# sudo echo "kkhuong ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.tmp
# sudo -u kkhuong bash << EOF

# INSTALL DEPENDENCIES
sudo apt-get update
# sudo apt-get install -y make cmake g++ ruby rake libcurl4-openssl-dev libssl-dev zlib1g-dev ruby-dev nodejs
sudo apt-get install -y make cmake g++ libcurl4-openssl-dev libssl-dev zlib1g-dev nodejs
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node  # node symlink

# REMOVE ANY EXISTING NGINX
sudo apt-get purge nginx nginx-full nginx-light nginx-naxsi nginx-common
sudo rm -rf /etc/nginx

# INSTALL RVM
\curl -sSL https://get.rvm.io | sudo bash -s -- --version latest --auto-dotfiles
# source /etc/profile.d/rvm.sh
