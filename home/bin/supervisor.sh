#!/bin/bash
if [[ -z $(ps -A|grep 'supervisord -c'|grep -v grep) ]]; then
	supervisord -c $HOME/etc/supervisor/supervisord.conf -d $HOME/etc/supervisor
	echo supervisord.sh: started
fi
