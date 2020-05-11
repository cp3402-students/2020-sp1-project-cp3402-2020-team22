#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIR_NAME=$(basename $SCRIPTPATH)
BACKUP_FILE="$SCRIPTPATH/init.d/wordpress-db.sql"
docker exec -i "${DIR_NAME,,}_db_1/" usr/bin/mysql -uwordpress --password=wordpress wordpress < "$BACKUP_FILE"
echo "Wordpress database restored from $BACKUP_FILE"
$SHELL
