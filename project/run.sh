#!/bin/bash
useradd demo
echo "CG> terminal -s bash -u demo"

shellPid=""
re='^[0-9]+$'
while ! [[ $shellPid =~ $re ]]; do
	sleep 1
	shellPid=`ps -U demo -o pid= | xargs`
done
echo "/proc/$shellPid/cwd"
readlink "/proc/$shellPid/cwd"
echo `readlink "/proc/$shellPid/cwd"`

echo 'Try to create the file /tmp/result'
while [ ! -f /tmp/result ]
do
  sleep 1
done
echo 'Yeah, now write "toto" in it'
while ! grep "toto" /tmp/result ; do
	sleep 1
done 
echo 'Congratulations'
echo "CG> success"
sleep 2
