#!/bin/sh /etc/rc.common

BACKUP_DIR=/root/openhr20_backup/

# backup files
if [ -d /tmp/openhr20 ]; then
	cp -a /tmp/openhr20/*.rrd $BACKUP_DIR
fi

if [ -f /tmp/openhr20.sqlite ]; then
	cp /tmp/openhr20.sqlite $BACKUP_DIR
fi 



