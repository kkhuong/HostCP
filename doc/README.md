Documentation
=============
This file contains a collection of notes we developed over the course of developing ZeroCP. Eventually, we will better organize these notes.

Notes
-----
- `sudo /opt/nginx/sbin/nginx` to start NGINX
- `sudo kill $(cat /opt/nginx/logs/nginx.pid)` to stop NGINX
- restarting is the same as stopping and then starting
- have users automatically added to `rvm` group so they can use rvm
- When you are done with setup procedures
  - This is the command to create a new user `useradd -m -p $(openssl passwd -1 -salt $SALT $PASS) -s /bin/bash $USER`. Please check if this command is secure (and truly zero knowledge before implementing) ***security concerns**
- `https://www.phusionpassenger.com/library/indepth/ruby/multiple_rubies.html` for path. we need to do this to have passenger for every rubies
- Our server only supports `ruby-2.3.3` for now. We should have a staff using `adminuser` to install every single rubies so that end-users can use any of them for their app.
- Start looking into Node.js and PHP (DONE) support. Python support will come later.

Milestone 1.0
-------------
Milestone 1.0 will consist of a API (JSON) system only. It will support these features
- Root and Reseller ("WHM")
  - Create a new user account (i.e. add new customer)
    - Auto add to `rvm` group
- End-user ("cPanel")
  - Pseudo-add new domain
  - Points domain to a "language" such as PHP (recommended) or ROR
  - Preview the "app" hosted (perhaps a port)
- Really install every version of Ruby for now. It appears that some Ruby gems require only some strict version. Also change RVM to Mixed Mode.
  
- Overview
  - For every app hosted, edit NGINX conf files `/opt/nginx/conf/nginx.conf` accordingly
  
** DNS will be handled by other providers for now

Errors Encountered
------------------
We managed to get a demo app (omrails) up and running. However, note that we have encountered many errors:
- `development` environment is not the same as `production`. Ergo, something that may work with `passenger start` may not work. Encourage the customer to do `passenger start ...` to launch app as production before deploying for real because they do not have access to the error logs and the webpage does not show any error (unlike PHP in "development mode"). Example errors is that: syntax error on a production code but not on development code, production requires other software such as postgres (opposing sqlite for dev mode), `SECRET_KEY_BASE`
- [X] Most of the time, error stems from forgeting to set the `SECRET_KEY_BASE`. We shall declare `SECRET_KEY_BASE` as an environmental variable to reduce deployment errors. We should remind the customers to generate and set their own though.

LEMP Stack (Now slightly automated + 5.6 support)
-------------------------------------------------
We will list the steps in a high level description below on how to setup the LEMP Stack. Checkmark will denote that the step has been taken care of by the installation scripts.

- [X] Follow the "installation" instructions. You should then have PHP 5.6, 7.0 + NGINX + MySQL installed
- [X] Get PHP to work with NGINX
  - [X] Edit the php5.6-fpm configuration file `/etc/php/5.6/fpm/pool.d/www.conf` and change line with `listen` to `listen = 127.0.0.1:9000`
  - [X] Edit the php7.0-fpm configuration file `/etc/php/7.0/fpm/pool.d/www.conf` and change line with `listen` to `listen = 127.0.0.1:9001`
  - [X] Restart php5.6-fpm using the command `sudo systemctl restart php5.6-fpm.service`
  - [X] Restart php7.0-fpm using the command `sudo systemctl restart php7.0-fpm.service`
  - [X] ~~In NGINX configuration files, update lines with `fastcgi_pass` to `fastcgi_pass   127.0.0.1:9000;` (for PHP5.6) - test only~~
  - [X] ~~Also update `fastcgi_param  SCRIPT_FILENAME` to `fastcgi_param  SCRIPT_FILENAME  __HOME_PATH__$fastcgi_script_name;`. Replace `__HOME_PATH__` with the root directory of the project --- exclude the trailing slash.~~ (Automate this)
  - [X] Restart NGINX. Now everything should be up and running. Can easily test with a simple `<?php phpinfo(); ?>` script.
  
  ![PHP Mods](https://raw.githubusercontent.com/kkhuong/ZeroCP/master/doc/php_essentials.png)

### A little note about NGINX for multiple websites (verify this)

- Most NGINX installations happen in `/etc/nginx`. Withal, our Passenger installation installs NGINX in `/opt/nginx`.
- Our NGINX is customized to work with Passenger. As a result, installation is different from most online guides. We shall separate "server blocks" from NGINX conf files (i.e. every website hosted on the server has its own conf file). To imitate the Apache setup,
  - [X] `mkdir /opt/nginx/sites-available`
  - [X] `ln -s /opt/nginx/sites-available /opt/nginx/sites-enabled`. Yes, we acknowledge this is werid but we want to follow the conventions.
  - [X] Edit the `http` block inside `/opt/nginx/nginx.conf` and add this line
    ```
    include /opt/nginx/sites-enabled/*;
    ```
  - [X] Put conf files into `/opt/nginx/sites-available` and restart NGINX
  

