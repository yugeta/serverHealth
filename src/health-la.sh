#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"
query=$1

while read line
do
    if [ -n "${line}" ];then

        # 1m / 5m / 15m
        if [ -z "$query" ];then
            echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} cat /proc/loadavg | awk '{print $1\"/\"$2\"/\"$3}'`"

        # 1m
        elif test $query == 1;then
            echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} cat /proc/loadavg | awk '{print $1}'`"

        # 5m
        elif test $query == 2;then
            echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} cat /proc/loadavg | awk '{print $2}'`"

        # 15m
        elif test $query == 3;then
            echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} cat /proc/loadavg | awk '{print $3}'`"

        fi
    fi
done<$dataFile
