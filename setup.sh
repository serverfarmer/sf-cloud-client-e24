#!/bin/sh

if [ ! -d /usr/share/php/sdk-1.6.2 ]; then
	echo "installing aws-sdk"
	mkdir -p /usr/share/php
	cd /usr/share/php
	wget http://pear.amazonwebservices.com/get/sdk-latest.zip
	unzip -b sdk-latest.zip
fi

/opt/farm/scripts/setup/extension.sh sf-php

echo "setting up base directory"
mkdir -p /etc/local/.cloud/e24
