#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo "["${line}"]\t: `ssh -no 'ConnectTimeout 3' ${line} cat /etc/passwd|grep $1`"
    fi
done<$dataFile
