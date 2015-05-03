#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo ${line}"\t: `ssh -no 'ConnectTimeout 3' ${line} top -bn 1 | grep 'Cpu(s):' | awk '{gsub(/\%Cpu/,\"Cpu\");gsub(/\%/,\" \");print 100-$8;}'`%"
    fi
done<$dataFile
