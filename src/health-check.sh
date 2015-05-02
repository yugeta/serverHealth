#!/bin/bash

pwd
dataFile="servers.list"

while read line
do
    #echo ${line}
    if [ -n "${line}" ]
    then
        echo "--["${line}"]"
        query=$1

        if test $query == "cpu"
        then
            echo "`ssh -n ${line} cat `"
        elif test $query == "memory"
        then

        fi

        #OS分岐
        # os="`ssh -n ${line} cat /etc/issue|awk '{if($1&&!flg){flg=$1}}END{print flg}'`"
        #
        # echo $os
        #
        # #CentOs
        # if test $os == "CentOS"
        # then
        #     echo "`ssh -n ${line} yum install -y $query`"
        #     #echo "centos"
        # #Debian
        # elif test $os == "Debian"
        # then
        #     echo "`ssh -n ${line} apt-get install -y $query`"
        # #Ubuntu
        # elif test $os == "Ubuntu"
        # then
        #     echo "`ssh -n ${line} apt-get install -y $query`"
        #     #echo "ubuntu"
        # fi
    fi
done<$dataFile
