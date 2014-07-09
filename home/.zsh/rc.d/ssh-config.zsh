# Combine SSH configs.
if [ -d ~/.ssh/config.d ]; then
	rm -f ~/.ssh/config
	echo "# This file has been automatically generated. Do not edit it directly." > ~/.ssh/config
	for filename in ~/.ssh/config.d/*; do
		echo "\n#\n# $filename\n#\n" >> ~/.ssh/config
		cat $filename >> ~/.ssh/config
	done
fi
