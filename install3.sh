#!/bin/bash


# INSTALL PASSENGER + NGINX
rvmsudo gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor


# make admin user
# add admin user to rvm group: sudo usermod -a -G rvm USER
# have the user install every single rubies
# potentially delete the user?
# setup paths?
# install system dependencies: ruby, nginx, node, passenger, (pureftp), (dns_stuff?), (postgres), (mysql), (mongodb)

sudo cp -r misc/skeleton/. /etc/skel/

# replace nginx default files for server_ip:80, (or perhaps disable it), 

