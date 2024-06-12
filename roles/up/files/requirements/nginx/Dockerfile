FROM	nginx:1.27

RUN		apt update && apt upgrade -y &&	\
		apt install -y openssl

RUN		mkdir -p /etc/nginx/certs
RUN		openssl req -x509 -nodes \
			-out /etc/nginx/certs/cloud-1.crt \
			-keyout /etc/nginx/certs/cloud-1.key \
			-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=cloudaj.duckdns.org/UID=ajung"

RUN		rm -f /etc/nginx/conf.d/*.conf
COPY	conf/nginx.conf /etc/nginx/conf.d/

CMD		["nginx", "-g", "daemon off;"]
