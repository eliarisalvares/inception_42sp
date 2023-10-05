FROM alpine:3.17

ARG MYSQL_HOST
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_URL
ARG WP_TITLE
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_PASSWORD
ARG WP_USER_EMAIL


# Move scripts to container
COPY tools/wp-entrypoint.sh /tmp/wp-entrypoint.sh
RUN chmod +x /tmp/wp-entrypoint.sh

# Update and install dependencies
RUN apk update && apk add --no-cache mysql-client php-fpm php81 \
			php81-phar php81-common php81-session php81-iconv php81-json \
			php81-gd php81-curl php81-xml php81-mysqli php81-imap php81-cgi \
			fcgi php81-pdo php81-pdo_mysql php81-soap php81-posix php81-tokenizer \
			php81-gettext php81-ldap php81-ctype php81-dom php81-simplexml

# Download and configure Wordpress
WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --allow-root

EXPOSE 9000
RUN echo "listen = 0.0.0.0:9000" >> /etc/php81/php-fpm.d/www.conf

ENTRYPOINT [ "ash", "-f", "/tmp/wp-entrypoint.sh" ]