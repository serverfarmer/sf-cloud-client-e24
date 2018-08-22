#!/bin/sh
. /opt/farm/scripts/functions.dialog

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ -f /etc/local/.cloud/e24/$1.sh ]; then
	echo "error: cloud account \"$1\" already configured"
	exit 1
fi


API_KEY="`input \"enter e24cloud.com api key\" put-your-key-here`"
API_SECRET="`input \"enter e24cloud.com api secret\" put-your-secret-here`"

REGION="`input \"enter e24cloud.com region to use\" eu-poland-1poznan`"
DEFAULT_INSTANCE_TYPE="`input \"enter e24cloud.com default instance type\" m1.small`"

mkdir -p /etc/local/.cloud/e24
echo "#!/bin/sh
#
# e24cloud.com API key and secret:
#
export E24_API_KEY=$API_KEY
export E24_API_SECRET=$API_SECRET
#
# region to use (eu-poland-1poznan or eu-poland-1poznan2):
#
export E24_REGION=$REGION
#
# Ubuntu 18.04 LTS image id:
#
export E24_AMI_ID=ami-00000bb7
#
# default instance type to use, when type isn't explicitely specified
#
export E24_DEFAULT_INSTANCE_TYPE=$DEFAULT_INSTANCE_TYPE
" >/etc/local/.cloud/e24/$1.sh
chmod 0600 /etc/local/.cloud/e24/$1.sh
