# Combine SSH configs.
if [[ -d ~/.ssh/config.d ]]; then
	HEAD="# This file has been automatically generated. Do not edit directly."
	if [[ -f ~/.ssh/config && `head -n 1 ~/.ssh/config` != $HEAD ]]; then
		mv ~/.ssh/config ~/.ssh/config.d/000-original
	fi
	echo $HEAD >! ~/.ssh/config
	for filename in ~/.ssh/config.d/*; do
		echo "\n#\n# $filename\n#\n" >> ~/.ssh/config
		cat $filename >> ~/.ssh/config
	done
fi
