#!/bin/bash
if [[ -z $(mount|grep /Volumes/nfs) ]]; then
	if [[ -n $(ping -o -t 1 nas4free 2>&1|grep "1 packets received") ]]; then
		mkdir -p /Volumes/nfs
		mount -t nfs nas4free:/mnt/pool/nfs /Volumes/nfs
		echo nfs.sh: mounted
	fi
fi
