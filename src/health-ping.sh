#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo ${line}"\t: `ping -t 3 -c 1 ${line}|awk '{if($0~"icmp_" && $0~"ttl=" && $0~"time="){flg++}}END{if(!flg){print \"error\"}}'`"
    fi
done<$dataFile
