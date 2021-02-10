#!/bin/bash

watchdog() {
    PID=$1

    while(true); do
        FAIL=0

        journalctl -S '3min ago' -u openhr20  | grep -q '\-\- No entries \-\-' && FAIL=1

        if [[ $FAIL -eq 0 ]]; then
            /bin/systemd-notify WATCHDOG=1;
            sleep $(($WATCHDOG_USEC / 2000000))
        else
	    echo "watchdog check failed"
            sleep 1
        fi
    done
}

watchdog $$ &

exec /usr/bin/php /srv/openhr20/rfmsrc/frontend/tools/daemon.php
