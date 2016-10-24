#!/bin/ksh
for i in `cfgadm |grep fc-fabric|awk '{print $1}'`
do
dev="`cfgadm -lv $i|grep devices |awk '{print $NF}'`"
wwn="`luxadm -e dump_map $dev |grep 'Host Bus'|awk '{print $4}'`"
echo "$i: $wwn"
done