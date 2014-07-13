#!/bin/bash
if [[ -z $(mount|grep /Volumes/dataset) ]]; then
	if [[ -n $(ping -o -t 1 nas4free 2>&1|grep "1 packets received") ]]; then
		mkdir -p /Volumes/dataset
		mount -t nfs nas4free:/mnt/pool/dataset /Volumes/dataset
		echo dataset.sh: mounted
	else
		wakeonlan 00:25:90:30:A7:F3 > /dev/null
	fi
fi
