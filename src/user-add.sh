#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"

while read line
do
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"
        echo "`ssh -no 'ConnectTimeout 3' ${line} useradd -m -s /bin/bash -g root -ou 0 -p \`perl -e \"print(crypt('$1','aa'));\"\` $1`"
    fi
done<$dataFile
