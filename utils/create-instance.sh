#!/bin/sh

if [ "$2" = "" ]; then
	echo "usage: $0 <cloud-account> <ssh-key-name> [instance-type]"
	exit 1
elif [ ! -f /etc/local/.cloud/e24/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
. /etc/local/.cloud/e24/$account.sh

if [ "$3" != "" ]; then
	type=$3
else
	type=$E24_DEFAULT_INSTANCE_TYPE
fi

ami_id=`/opt/farm/ext/cloud-client-e24/utils/get-ubuntu-image.sh $account`

/opt/farm/ext/cloud-client-e24/internal/create-instance.php $account $2 $type $ami_id
