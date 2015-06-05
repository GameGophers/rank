#!/bin/bash
set -e
ETCD_HOST="http://172.17.42.1:2379"
NSQD_HOST="http://172.17.42.1:4151"
NSQLOOKUPD_HOST="172.17.42.1:4161"
case $1 in
	production)
		ETCD_HOST="http://127.0.0.1:2379"
		NSQD_HOST="http://172.17.42.1:4151"
		NSQLOOKUPD_HOST="172.17.42.1:4161"
		;;
	testing)
		ETCD_HOST="http://127.0.0.1:2379"
		NSQD_HOST="http://172.17.42.1:4151"
		NSQLOOKUPD_HOST="172.17.42.1:4161"
		;;
esac
export ETCD_HOST=$ETCD_HOST
export NSQD_HOST=$NSQD_HOST
export NSQLOOKUPD_HOST=$NSQLOOKUPD_HOST
echo "ETCD_HOST set to:" $ETCD_HOST
echo "NSQD_HOST set to:" $NSQD_HOST
echo "NSQLOOKUPD_HOST set to:" $NSQLOOKUPD_HOST
echo "HOSTNAME" $HOSTNAME
$GOBIN/rank