#!/bin/bash

# install system dependencies: ruby, nginx, node, passenger, (pureftp), (dns_stuff?), (postgres), (mysql), (mongodb)

sudo cp -r misc/skeleton/. /etc/skel/

# replace nginx default files for server_ip:80, (or perhaps disable it), 

