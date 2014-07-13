#!/bin/bash
hash brew 2>/dev/null && {
	brew update
}
if [ -d $HOME/dataset ]; then
	clean-torrents.py /Volumes/Data/Torrents
	fetch-git-projects.sh $HOME/dataset/Projects
fi
fetch-git-projects.sh $HOME/Projects
fetch-git-projects.sh $HOME/ixc/Projects
