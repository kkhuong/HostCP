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

Errors Encountered
==================
We managed to get a demo app (omrails) up and running. However, note that we have encountered many errors:
- `development` environment is not the same as `production`. Ergo, something that may work with `passenger start` may not work. Encourage the customer to do `passenger start ...` to launch app as production before deploying for real because they do not have access to the error logs and the webpage does not show any error (unlike PHP in "development mode"). Example errors is that: syntax error on a production code but not on development code, production requires other software such as postgres (opposing sqlite for dev mode), `SECRET_KEY_BASE`
- [X] Most of the time, error stems from forgeting to set the `SECRET_KEY_BASE`. We shall declare `SECRET_KEY_BASE` as an environmental variable to reduce deployment errors. We should remind the customers to generate and set their own though.

LEMP Stack
==========
We are now working on the LEMP Stack support. We will document our process here so that we can later work it into the installation scripts.
- [ ] Install `mysql-server` thru `sudo apt-get install mysql-server`. It will prompt the person running the command to enter a password for the root user for the database. **ALWAYS ALWAYS ALWAYS remember to find a way to automate this when possible.** (*Milestone 2*)
