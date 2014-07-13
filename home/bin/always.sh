#!/bin/bash
dataset.sh
supervisor.sh
if [ -f ~/Desktop/_test ]; then
	rm ~/Desktop/_test
else
	touch ~/Desktop/_test
fi
