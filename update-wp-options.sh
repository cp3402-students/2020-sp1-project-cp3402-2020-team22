#!/bin/bash
#
# update-wp-options.sh - Update the blogname, siteurl and home options
#
# Examples:
#	1. Update IP address and set site and name and description to defaults
#		$ ./update-wp-options.sh
#	1. Update IP address and site name and description
#		$ ./update-wp-options.sh 'Wordpress Test' 'This is my WordPress site'
#

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIR_NAME=$(basename $SCRIPTPATH)

SITE_NAME="$($SCRIPTPATH/exec-query.sh "SELECT option_value FROM wp_options WHERE option_name='blogname'" 2> /dev/null | tail -1)"
SITE_DESCRIPTION="$($SCRIPTPATH/exec-query.sh "SELECT option_value FROM wp_options WHERE option_name='blogdescription'" 2> /dev/null | tail -1)"

#UPDATE wp_options SET option_value='__SITE_NAME__' WHERE option_name='blogname';
#UPDATE wp_options SET option_value='__SITE_DESCRIPTION__' WHERE option_name='blogdescription';



SITE_NAME=${1:-"$SITE_NAME"}
SITE_DESCRIPTION=${2:-"$SITE_DESCRIPTION"}
IP_ADDR=$(localhost)
DB_CONTAINER_NAME="${DIR_NAME,,}_db_1"

echo "Setting wp_options in container $DB_CONTAINER_NAME ..."
echo "  blogname=$SITE_NAME"
echo "  blogdescription=$SITE_DESCRIPTION"
echo "  siteurl=http://$IP_ADDR"
echo "  home=http://$IP_ADDR"

IP_ADDR_PATTERN='s/__IP_ADDR__/'$IP_ADDR'/g'
SITE_NAME_PATTERN='s/__SITE_NAME__/'$SITE_NAME'/g'
SITE_DESCRIPTION_PATTERN='s/__SITE_DESCRIPTION__/'$SITE_DESCRIPTION'/g'

sed -e "$IP_ADDR_PATTERN" -e "$SITE_NAME_PATTERN" -e "$SITE_DESCRIPTION_PATTERN" < update-wp-options_TEMPLATE.sql > .update-wp-options.sql

docker exec -i "${DB_CONTAINER_NAME}" sh -c 'exec mysql -uwordpress -pwordpress' < .update-wp-options.sql 2>&1 | grep -v "Using a password on the command line"
rm -f .update-wp-options.sql
$SHELL

