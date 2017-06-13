#!/bin/bash
useradd demo
echo "CG> terminal -s bash -u demo"

while [ ! -f /tmp/result ]
do
  sleep 1
done
echo "CG> success"
sleep 2
