# defines base image
# the following alpine version is required by the subject
FROM alpine:3.17

# get environment variables from the ../.env file
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD

# COPY the configuration file to the container
COPY ./conf/mariadb.conf /etc/my.cnf

# COPY the mariadb_script.sh file to the container
COPY ./tools/mariadb_script.sh /tmp/mariadb_script.sh

# Change the permissions of the mariadb_script.sh file to be executable and
# run the mariadb_script.sh file (ash -f is used to force the execution of the file)
RUN chmod a+x /tmp/mariadb_script.sh; ash -f /tmp/mariadb_script.sh

# update and upgrade the alpine packages
RUN apk update && apk upgrade

# install mariadb and mariadb-client and create the required directories
# as well as change the ownership of the directories to mysql and
# change the permissions of the directories to 777 which means that
# everyone can read, write and execute
RUN mkdir -p /var/lib/mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld \
	&& apk add --no-cache mariadb mariadb-client openrc; \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# expose port 3306 so that it can be accessed from outside the container
EXPOSE 3306

# ENTRYPOINT is used to run the mariadb server
ENTRYPOINT  [ "mariadbd-safe" ]