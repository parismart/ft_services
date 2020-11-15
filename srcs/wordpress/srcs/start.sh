#!/bin/sh

# Start Telegraf and Wordpress.
# php --help (-S, --server; Start the internal web server / -t, --docroot; Specify the root of the document for the internal web server).
telegraf & php -S 0.0.0.0:5050 -t /var/www/wordpress/
