
brew install homebrew/php/phpmyadmin 

Webserver configuration example (add this at the end of
your /etc/apache2/httpd.conf for instance) :
  Alias /phpmyadmin /usr/local/share/phpmyadmin
  <Directory /usr/local/share/phpmyadmin/>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    <IfModule mod_authz_core.c>
      Require all granted
    </IfModule>
    <IfModule !mod_authz_core.c>
      Order allow,deny
      Allow from all
    </IfModule>
  </Directory>
Then, open http://localhost/phpmyadmin

More documentation : file:///usr/local/opt/phpmyadmin/share/phpmyadmin/doc/

Configuration has been copied to /usr/local/etc/phpmyadmin.config.inc.php


If you get an error:
#2002 - The server is not responding (or the local MySQL server's socket is not correctly configured) 

Check where is your socket is:
locate mysql.sock

Then locate your php.ini:
php -i | grep php.ini

this will output something like:
 Configuration File (php.ini) Path => /opt/local/etc/php54
 Loaded Configuration File => /opt/local/etc/php54/php.ini

Edit your php.ini
 sudo vim /opt/local/etc/php54/php.ini

Change the lines:

 pdo_mysql.default_socket=/tmp/mysql.sock
 mysql.default_socket=/tmp/mysql.sock
 mysqli.default_socket = /tmp/mysql.sock

where /tmp/mysql.sock is the path to your socket.

Save your modifications and exit
Restart Apache
 sudo apachectl stop
 sudo apachectl start

If you are still facing the same issue try the following:

Edit the config file located at:
/usr/local/etc/phpmyadmin.config.inc.php

Add port number in host:
$cfg['Servers'][$i]['host'] = 'localhost:3306';
