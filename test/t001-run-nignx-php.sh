#!/bin/bash

# t001 - NGINX + PHP (Run)
# This test case tests if NGINX + PHP installation has been done properly
# and that the simple phpinfo() page works correctly.

# Files for testing
sudo cp -f info.php /opt/nginx/html/info.php
sudo cp -f php56.test.conf /opt/nginx/sites-available/
sudo cp -f php70.test.conf /opt/nginx/sites-available/

# Restart the NGINX server
sudo kill $(cat /opt/nginx/logs/nginx.pid)
sudo /opt/nginx/sbin/nginx

# (visit the localhost page and read content)
