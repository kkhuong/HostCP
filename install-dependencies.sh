#!/bin/bash

# INSTALL DEPENDENCIES
sudo apt-get update
sudo apt-get install -y make cmake g++ ruby rake libcurl4-openssl-dev libssl-dev zlib1g-dev ruby-dev

# REMOVE ANY EXISTING NGINX
sudo apt-get purge nginx nginx-full nginx-light nginx-naxsi nginx-common
sudo rm -rf /etc/nginx

# INSTALL PASSENGER + NGINX
wget http://acsweb.ucsd.edu/~kkhuong/passenger-5.1.5.tar.gz
tar -xzvf passenger-5.1.5.tar.gz -C /opt
rm passenger-5.1.5.tar.gz

echo "" >> /etc/bash.bashrc
echo "# Passenger Path" >> /etc/bash.bashrc
echo "PATH=/opt/passenger-5.1.5/bin:$PATH" >> /etc/bash.bashrc
echo "export PATH" >> /etc/bash.bashrc
echo "" >> /etc/bash.bashrc

PATH=/opt/passenger-5.1.5/bin:$PATH
export PATH

gem install rack  # required by passenger
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx  --languages ruby,python,nodejs,meteor

# INSTALL RVM
\curl -sSL https://get.rvm.io | sudo bash -s -- --version latest

# make admin user
# add admin user to rvm group: sudo usermod -a -G rvm USER
# have the user install every single rubies
# potentially delete the user?
# setup paths?
