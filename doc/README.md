Notes
=====

- `/opt/nginx/sbin/nginx` to start NGINX
- `sudo kill $(cat /opt/nginx/logs/nginx.pid)` to stop NGINX
- restarting is the same as stopping and then starting
- have users automatically added to `rvm` group so they can use rvm
- When you are done with setup procedures
  - This is the command to create a new user `useradd -m -p $(openssl passwd -1 -salt $SALT $PASS) -s /bin/bash $USER`. Please check if this command is secure (and truly zero knowledge before implementing) **security concerns***
