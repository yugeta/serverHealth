#!/bin/bash

pwd
dataFile="servers.list"

while read line
do
    #echo ${line}
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"
        sh=$1
        echo "`ssh -n ${line} $sh`"
    fi
done<$dataFile
