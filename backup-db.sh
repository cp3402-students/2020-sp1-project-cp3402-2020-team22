#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIR_NAME=$(basename $SCRIPTPATH)

BACKUP_FILE="$SCRIPTPATH/init.d/wordpress-db.sql"

docker exec "${DIR_NAME,,}_db_1/" usr/bin/mysqldump -uwordpress --password=wordpress wordpress > "$BACKUP_FILE" 2> /dev/null
echo "Wordpress database backed up to $BACKUP_FILE"
$SHELL