#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"
        echo "`ssh -no 'ConnectTimeout 3' ${line} userdel -rf $1`"
    fi
done<$dataFile
