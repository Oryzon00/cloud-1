FROM	wordpress:6.5

RUN			apt update && apt upgrade -y &&	apt install -y	\
				wget

# Installe CLI to configure wordpress
RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp

# Copy script to configure wordpress
COPY	script/config.sh	/var/www/config.sh

# ENTRYPOINT
