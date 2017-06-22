#!/bin/bash

sudo usermod -a -G rvm `whoami`
rvmsudo cleanup all

# install some rubies and dependencies for Passenger here
# ... we are commiting this change right now to see if we need to do something here
# ... we will find out by looking at the travis-ci build
# here i make and switch users
if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi
if sudo grep -q secure_path /etc/sudoers; then export rvmsudo_secure_path=1; fi

rvm reinstall ruby-2.3.3

rvm --default use ruby-2.3.3

gem install bundler --no-rdoc --no-ri
gem install rack  # required by passenger

# INSTALL PASSENGER + NGINX
gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor


# make admin user
# add admin user to rvm group: sudo usermod -a -G rvm USER
# have the user install every single rubies
# potentially delete the user?
# setup paths?
