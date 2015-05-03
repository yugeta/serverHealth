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
            if test $query == "apache"
            then
                query="httpd"
            elif test $query == "apache2"
            then
                query="httpd"
            fi
            echo "`ssh -no 'ConnectTimeout 3' ${line} yum list $query|grep $query`"
        #Debian
        elif test $os == "Debian"
        then
            if test $query == "apache"
            then
                query="apache2"
            fi
            echo "`ssh -no 'ConnectTimeout 3' ${line} dpkg -l $query|grep $query`"
        #Ubuntu
        elif test $os == "Ubuntu"
        then
            if test $query == "apache2"
            then
                query="apache2"
            fi
            echo "`ssh -no 'ConnectTimeout 3' ${line} dpkg -l $query|grep $query`"
        fi
    fi
done<$dataFile
