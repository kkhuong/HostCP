#!/bin/bash
sudo useradd -m -p $(openssl passwd -1 -salt SALT TEMP_PASSWORD) -s /bin/bash kkhuong
sudo usermod -a -G sudo kkhuong
sudo echo "kkhuong ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.tmp
sudo -u kkhuong bash << EOF

# INSTALL DEPENDENCIES
sudo apt-get update
# sudo apt-get install -y make cmake g++ ruby rake libcurl4-openssl-dev libssl-dev zlib1g-dev ruby-dev nodejs
sudo apt-get install -y make cmake g++ libcurl4-openssl-dev libssl-dev zlib1g-dev nodejs
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node  # node symlink

# REMOVE ANY EXISTING NGINX
sudo apt-get purge nginx nginx-full nginx-light nginx-naxsi nginx-common
sudo rm -rf /etc/nginx

# INSTALL RVM
\curl -sSL https://get.rvm.io | sudo bash -s -- --version latest

# install some rubies and dependencies for Passenger here
# ... we are commiting this change right now to see if we need to do something here
# ... we will find out by looking at the travis-ci build
# here i make and switch users
sudo usermod -a -G rvm `whoami`
if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi
if sudo grep -q secure_path /etc/sudoers; then export rvmsudo_secure_path=1; fi

rvm install ruby-2.3.1
rvm --default use ruby-2.3.1

gem install bundler --no-rdoc --no-ri
gem install rack  # required by passenger

# INSTALL PASSENGER + NGINX
wget http://acsweb.ucsd.edu/~kkhuong/passenger-5.1.5.tar.gz
sudo tar -xzvf passenger-5.1.5.tar.gz -C /opt
rm passenger-5.1.5.tar.gz

sudo echo "" >> /etc/bash.bashrc
sudo echo "# Passenger Path" >> /etc/bash.bashrc
sudo echo "PATH=/opt/passenger-5.1.5/bin:$PATH" >> /etc/bash.bashrc
sudo echo "export PATH" >> /etc/bash.bashrc
sudo echo "" >> /etc/bash.bashrc

PATH=/opt/passenger-5.1.5/bin:$PATH
export PATH

passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor

EOF
# make admin user
# add admin user to rvm group: sudo usermod -a -G rvm USER
# have the user install every single rubies
# potentially delete the user?
# setup paths?
