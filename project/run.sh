#!/bin/bash
useradd demo
echo "CG> terminal -s bash -u demo"

shellPid=""
re='^[0-9]+$'
while ! [[ $shellPid =~ $re ]]; do
	sleep 1
	echo "test"
	$shellPid=`ps -U demo -o pid=`
done
echo "test" > "/proc/$shellPid/fd/1"

while [ ! -f /tmp/result ]
do
  sleep 1
done
echo "CG> success"
sleep 2
