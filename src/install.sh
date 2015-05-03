#!/bin/bash

DIR=`dirname $0`
dataFile=$DIR"/servers.list"
query=$1

while read line
do
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"

        #OS分岐
        os="`ssh -no 'ConnectTimeout 3' ${line} cat /etc/issue|awk '{if($1&&!flg){flg=$1}}END{print flg}'`"

        #CentOs
        if test $os == "CentOS"
        then
            echo "`ssh -no 'ConnectTimeout 3' ${line} yum install -y $query`"
        #Debian
        elif test $os == "Debian"
        then
            echo "`ssh -no 'ConnectTimeout 3' ${line} apt-get install -y $query`"
        #Ubuntu
        elif test $os == "Ubuntu"
        then
            echo "`ssh -no 'ConnectTimeout 3' ${line} apt-get install -y $query`"
        fi
    fi
done<$dataFile
