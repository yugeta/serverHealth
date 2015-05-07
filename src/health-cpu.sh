#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo ${line}"\t: `ssh -no 'ConnectTimeout 10' ${line} top -bn 1|grep Cpu|awk '{split($0,dat,":");split(dat[2],val,\",\");for(i in val){if(val[i]~\"id\"){print 100-(val[i]*1)\"%\";}}}'`";
    fi
done<$dataFile
