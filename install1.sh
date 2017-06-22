#!/bin/bash

# Make new admin user
sudo useradd -m -p $(openssl passwd -1 -salt SALT TEMP_PASSWORD) -s /bin/bash kkhuong
sudo usermod -aG sudo kkhuong
