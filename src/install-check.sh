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
        # echo "`ssh -n ${line} $query --version`"
        #OS分岐
        os="`ssh -n ${line} cat /etc/issue|awk '{if($1&&!flg){flg=$1}}END{print flg}'`"

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
            echo "`ssh -n ${line} yum list $query|grep $query`"
        #Debian
        elif test $os == "Debian"
        then
            if test $query == "apache"
            then
                query="apache2"
            fi
            echo "`ssh -n ${line} dpkg -l $query|grep $query`"
        #Ubuntu
        elif test $os == "Ubuntu"
        then
            if test $query == "apache2"
            then
                query="apache2"
            fi
            echo "`ssh -n ${line} dpkg -l $query|grep $query`"
        fi
    fi
done<$dataFile
