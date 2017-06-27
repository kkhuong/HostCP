#!/bin/bash

# INSTALL PASSENGER + NGINX
rvmsudo gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor

# DEFAULT RUBY APP SECRET KEY BASE
sudo echo "" >> /etc/bash.bashrc
sudo echo "# DEFAULT RUBY APP SECRET_KEY_BASE" >> /etc/bash.bashrc
sudo echo 'export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c' >> /etc/bash.bashrc
export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c

# install system dependencies: ruby (done), nginx (done), node (done), passenger (done), (pureftp), (dns_stuff?), (postgres), mysql (done), (mongodb)

# default files for new users after this point
sudo cp -r misc/skeleton/. /etc/skel/

# "configure" php
sudo cp -f misc/conf/php5.6-fpm.www.conf /etc/php/5.6/fpm/pool.d/www.conf
sudo systemctl restart php5.6-fpm.service
sudo cp -f misc/conf/php7.0-fpm.www.conf /etc/php/7.0/fpm/pool.d/www.conf
sudo systemctl restart php7.0-fpm.service

# "configure" nginx
sudo mkdir /opt/nginx/sites-available
sudo ln -s /opt/nginx/sites-available /opt/nginx/sites-enabled
sudo cp -f misc/conf/nginx.conf /opt/nginx/conf/nginx.conf
cd /opt/nginx/sites-enabled/  # here we are just making sure that if the user runs this script twice, we would not have created symlink twice thus creating error
sudo rm -f sites-available
sudo kill $(cat /opt/nginx/logs/nginx.pid)  # here we restart nginx
sudo /opt/nginx/sbin/nginx
