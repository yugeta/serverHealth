#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"
sh=$1

while read line
do
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"
        echo "`ssh -no 'ConnectTimeout 3' ${line} $sh`"
    fi
done<$dataFile
