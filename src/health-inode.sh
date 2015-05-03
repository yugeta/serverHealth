#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        #echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} free -m | awk '{if($1==\"Mem:\"){total = $2}else if($1==\"-/+\"){data = $3}}END{print int(data/total*1000)/10}'`%"
        echo "--["${line}"]----- \n`ssh -no 'ConnectTimeout 3' ${line} df -i`"
    fi
done<$dataFile
