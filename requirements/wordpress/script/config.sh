echo "start script "

# download wordpress
wp core download --allow-root

sleep 5

if [ -f /var/www/html/wp-config.php ]
then
	echo "===> wp-config.php already exist <==="
else
	echo "in condition"

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html' \
						--skip-check

sleep 5

	wp core install 	--url="cloudaj.duckdns.org" \
						--title="My website" \
						--admin_user=$WP_ADMIN_USER \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--skip-email \
						--path="/var/www/html/" \
						--allow-root

sleep 5

	wp user create	$WP_AUTHOR_USER $WP_AUTHOR_EMAIL \
						--role=author	\
						--user_pass=$WP_AUTHOR_PASSWORD	\
						--allow-root	\
						--path='/var/www/html'
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
    mkdir /run/php
fi

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

sleep 2
echo "===> WORDPRESS IS UP <==="

exec php-fpm7.3 --nodaemonize
