# Make sure mod_headers is enabled in Apache
sudo a2enmod headers

# Place this in .htaccess

<IfModule mod_headers.c>
    Header set X-Robots-Tag "noindex, nofollow"
    Header set Cache-Control "private, no-cache, no-store, proxy-revalidate, no-transform"
    Header set Pragma "no-cache"
</IfModule>
