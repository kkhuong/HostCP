Notes
=====

- `/opt/nginx/sbin/nginx` to start NGINX
- `sudo kill $(cat /opt/nginx/logs/nginx.pid)` to stop NGINX
- restarting is the same as stopping and then starting
- have users automatically added to `rvm` group so they can use rvm
- When you are done with setup procedures
  - This is the command to create a new user `useradd -m -p $(openssl passwd -1 -salt $SALT $PASS) -s /bin/bash $USER`. Please check if this command is secure (and truly zero knowledge before implementing) ***security concerns**
- `https://www.phusionpassenger.com/library/indepth/ruby/multiple_rubies.html` for path. we need to do this to have passenger for every rubies
  
- Our server only supports `ruby-2.3.3` for now. We should have a staff using `adminuser` to install every single rubies so that end-users can use any of them for their app.
- Start looking into Node.js and PHP support. Python support will come later.

Milestone 1.0
=============
Milestone 1.0 will consist of a API (JSON) system only. It will support these features
- Root and Reseller ("WHM")
  - Create a new user account (i.e. add new customer)
    - Auto add to `rvm` group
- End-user ("cPanel")
  - Pseudo-add new domain
  - Points domain to a "language" such as PHP (recommended) or ROR
  - Preview the "app" hosted (perhaps a port)
  
- Overview
  - For every app hosted, edit NGINX conf files `/opt/nginx/conf/nginx.conf` accordingly
  
** DNS will be handled by other providers for now
