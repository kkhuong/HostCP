#!/bin/bash



# INSTALL PASSENGER + NGINX
rvmsudo gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor

# DEFAULT RUBY APP SECRET KEY BASE
sudo echo "" >> /etc/bash.bashrc
sudo echo "# DEFAULT RUBY APP SECRET_KEY_BASE" >> /etc/bash.bashrc
sudo echo 'export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c' >> /etc/bash.bashrc
export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c

# install system dependencies: ruby, nginx, node, passenger, (pureftp), (dns_stuff?), (postgres), (mysql), (mongodb)

sudo cp -r misc/skeleton/. /etc/skel/

# replace nginx default files for server_ip:80, (or perhaps disable it),
