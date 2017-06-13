#!/bin/bash
useradd demo
echo "CG> terminal -s bash -u demo"

sleep 2
psResult=`ps -U demo -o pid=`
 
psResultArr=($psResult)
shellPid=${psResultArr[1]}
echo $shellPid
echo "test" > "/proc/$shellPid/fd/1"

while [ ! -f /tmp/result ]
do
  sleep 1
done
echo "CG> success"
sleep 2
