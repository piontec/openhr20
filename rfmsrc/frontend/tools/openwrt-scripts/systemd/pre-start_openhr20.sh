#!/bin/sh

BACKUP_DIR=/root/openhr20_backup/

# bring back backup files
if [ -d $BACKUP_DIR ]; then
	if [ ! -d /tmp/openhr20/ ]; then
		mkdir /tmp/openhr20
	fi
	cp -a $BACKUP_DIR/*.rrd /tmp/openhr20/
fi

if [ -f $BACKUP_DIR/openhr20.sqlite ]; then
	cp $BACKUP_DIR/openhr20.sqlite /tmp/
fi
