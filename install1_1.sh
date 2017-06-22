#!/bin/bash

# INSTALL DEPENDENCIES
sudo apt-get update
sudo apt-get install -y make cmake g++ libcurl4-openssl-dev libssl-dev zlib1g-dev nodejs postgresql postgresql-contrib python-psycopg2 libpq-dev
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node  # node symlink

# REMOVE ANY EXISTING NGINX
sudo apt-get purge nginx nginx-full nginx-light nginx-naxsi nginx-common
sudo rm -rf /etc/nginx

# INSTALL RVM
\curl -sSL https://get.rvm.io | sudo bash -s -- --version latest --auto-dotfiles
