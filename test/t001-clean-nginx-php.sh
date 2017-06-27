#!/bin/bash

# t001 - NGINX + PHP (Clean)
# This test case tests if NGINX + PHP installation has been done properly
# and that the simple phpinfo() page works correctly.

# Files for testing
sudo rm /opt/nginx/html/info.php
sudo rm /opt/nginx/sites-available/php56.test.conf
sudo rm /opt/nginx/sites-available/php70.test.conf

# Restart the NGINX server
sudo kill $(cat /opt/nginx/logs/nginx.pid)
sudo /opt/nginx/sbin/nginx
