if [ ! -f "$PROTECT_FILE" ]; then
		rm -f /var/www/wordpress/wp-config.php

		wp config create	--allow-root \
							--dbname=$MYSQL_DATABASE \
							--dbuser=$MYSQL_USER \
							--dbpass=$MYSQL_PASSWORD \
							--dbhost=mariadb:3306 \
							--path='/var/www/wordpress' \
							--skip-check

		wp core install 	--url="cloudaj.duckdns.org" \
							--title="My website" \
							--admin_user=$WP_ADMIN_USER \
							--admin_password=$WP_ADMIN_PASSWORD \
							--admin_email=$WP_ADMIN_EMAIL \
							--skip-email \
							--path="/var/www/wordpress/" \
							--allow-root

		wp user create	$WP_AUTHOR_USER $WP_AUTHOR_EMAIL \
							--role=author	\
							--user_pass=$WP_AUTHOR_PASSWORD	\
							--allow-root	\
							--path='/var/www/wordpress'

		touch $PROTECT_FILE
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
    mkdir /run/php
fi

exec php-fpm7.3 --nodaemonize
