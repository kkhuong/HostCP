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
- [ ] `sudo mysql_secure_installation` and then `THE_PASSWORD_ENTERED n n y y y y`. The configuration is that we do not change the root password and we make the system as convenient as possible to use.
- [ ] PHP Packages: `php-amqp php-amqplib php-analog php-apcu php-apigen php-apigen-theme-bootstrap php-apigen-theme-default php-assetic php-ast php-auth php-auth-http php-auth-sasl php-aws-sdk php-bcmath php-bz2 php-cache php-cache-lite php-cas php-cli-prompt php-codecoverage php-codesniffer php-compat php-composer-semver php-composer-spdx-licenses php-console-commandline php-console-table php-crypt-blowfish php-crypt-cbc php-crypt-chap php-crypt-gpg php-cssmin php-date php-db php-deepcopy php-directory-scanner php-doc php-doctrine-annotations php-doctrine-bundle php-doctrine-cache php-doctrine-cache-bundle php-doctrine-collections php-doctrine-common php-doctrine-data-fixtures php-doctrine-dbal php-doctrine-inflector php-doctrine-instantiator php-doctrine-lexer php-doctrine-orm php-dompdf php-dropbox php-elisp php-email-validator php-enchant php-fdomdocument php-file-iterator php-finder-facade php-finder-facade-doc php-font-lib php-fpdf php-fpm php-fshl php-fxsl php-geoip php-geshi php-getid3 php-gettext php-gnupg php-google-api-php-client php-google-auth php-guzzle-stream php-guzzlehttp php-guzzlehttp-promises php-guzzlehttp-psr7 php-guzzlehttp-ringphp php-guzzlehttp-ringphp-doc php-hamcrest php-html-safe php-htmlawed php-htmlpurifier php-http php-http-request php-http-request2 php-http-webdav-server php-icinga php-igbinary php-image-text php-imagick php-imap php-interbase php-intl php-invoker php-irods-prods php-jmespath php-json php-json-patch php-json-schema php-jwt php-kdyby-events php-kit-pathjoin php-league-flysystem php-letodms-core php-letodms-lucene php-libvirt-php php-log php-mail php-mail-mbox php-mail-mime php-mail-mimedecode php-markdown php-mbstring php-mcrypt php-mdb2 php-mdb2-driver-mysql php-mdb2-driver-pgsql php-memcache php-memcached php-mf2 php-mime-type php-mockery php-mockery-doc php-mongodb php-mysql php-monolog php-msgpack php-net-dime php-net-dns2 php-net-ftp php-net-imap php-net-ipv4 php-net-ipv6 php-net-ldap php-net-ldap2 php-net-ldap3 php-net-nntp php-net-publicsuffix php-net-sieve php-net-smartirc php-net-smtp php-net-socket php-net-url php-net-url2 php-net-whois php-nette php-nrk-predis php-numbers-words php-oauth php-openid php-pager php-parser php-patchwork-utf8 php-pclzip php-pdfparser php-pecl-http php-pecl-http-dev php-phpdbg php-phpdocumentor-reflection php-phpdocumentor-reflection-common php-phpdocumentor-reflection-docblock php-phpdocumentor-type-resolver php-phpseclib php-phpspec-prophecy php-picofeed php-pimple php-propro php-propro-dev php-proxy-manager php-psr-cache php-psr-http-message php-psr-log php-punic php-radius php-random-compat php-raphf php-raphf-dev php-react-promise php-readline php-redis php-rrd php-sabre-dav php-sabre-dav-2.1 php-sabre-event php-sabre-http php-sabre-http-3 php-sabre-uri php-sabre-vobject php-sabre-vobject-3 php-sabre-xml php-seclib php-securitylib php-sepa-direct-debit php-services-json php-services-weather php-smb php-smbclient php-soap php-solr php-sql-formatter php-ssh2 php-stomp php-streams php-superclosure php-swiftmailer php-sybase php-tcpdf php-text-captcha php-text-figlet php-text-languagedetect php-text-password php-text-template php-text-wiki php-timer php-token-stream php-tokenreflection php-twig php-twig-doc php-uuid php-validate php-webmozart-assert php-wikidiff2 php-xajax php-xdebug php-xml php-xml-htmlsax3 php-xml-parser php-xml-rpc2 php-xml-serializer php-xml-svg php-yac php-zend-code php-zend-db php-zend-eventmanager php-zend-hydrator php-zend-search php-zend-stdlib php-zend-xml php-zeta-base php-zeta-console-tools php-zeta-unit-test php-zip php-zipstreamer php-zmq php7.0-bcmath php7.0-bz2 php7.0-enchant php7.0-fpm php7.0-imap php7.0-interbase php7.0-intl php7.0-mbstring php7.0-mcrypt php7.0-phpdbg php7.0-soap php7.0-sybase php7.0-xsl php7.0-zip`
