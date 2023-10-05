#!/bin/sh

# mariadb-install-db --user=mysql --datadir=/var/lib/mysql will create the initial database
# directory structure and set the right ownership.
mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# mariadb-safe will start the server and listen for connections. It will also restart the server
# if it crashes. The sleep 5 is to give the server time to start up before we try to connect to it.
mariadbd-safe & sleep 5

# Create the database and the user and grant all privileges on the database.
# Execute SQL commands
mariadb -e "DROP USER IF EXISTS ''@'localhost'"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_DATABASE_PASSWORD';"
mariadb -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

echo "Database created successfully"