PROTECT_FILE="/var/www/html/.wordpress_protect"

if  [ ! -f "$PROTECT_FILE" ]; then

	echo "Wordpress is not configured, configuring..."

	rm -f	/var/www/html/wp-config.php

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb \
						--path='/var/www/html' \
						--skip-check

	wp core install 	--url="cloudaj.duckdns.org" \
						--title="Cloud-1" \
						--admin_user=$WP_ADMIN_USER \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--skip-email \
						--path="/var/www/html" \
						--allow-root
	
	touch $PROTECT_FILE

	echo "Wordpress configured !"

fi

echo "Wordpress is ready !"
