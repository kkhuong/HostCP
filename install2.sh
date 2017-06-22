#!/bin/bash

sudo usermod -a -G rvm root
sudo usermod -a -G rvm kkhuong

rvmsudo cleanup all


# install some rubies and dependencies for Passenger here
# ... we are commiting this change right now to see if we need to do something here
# ... we will find out by looking at the travis-ci build
# here i make and switch users
if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi
if sudo grep -q secure_path /etc/sudoers; then export rvmsudo_secure_path=1; fi



rvm reinstall ruby-2.3.3


# doing this because previous command often fail to finish before this
echo "Now using rvm ruby..."
sleep 45
rvm --default use ruby-2.3.3

gem install bundler --no-rdoc --no-ri
gem install rack  # required by passenger
