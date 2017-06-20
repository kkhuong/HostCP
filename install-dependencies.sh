#!/bin/bash

# Install Dependencies
sudo apt-get update
sudo apt-get install -y make cmake g++ ruby rake libcurl4-openssl-dev libssl-dev zlib1g-dev ruby-dev

# Removed some pre-installed softwares
sudo apt-get purge nginx nginx-full nginx-light nginx-naxsi nginx-common
sudo rm -rf /etc/nginx

# Ruby and Passenger + NGINX
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

# install rack
/usr/bin/ruby2.3 /usr/bin/gem install rack

# figure out how to install passenger and insert code here
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx  --languages ruby,python,nodejs,meteor
