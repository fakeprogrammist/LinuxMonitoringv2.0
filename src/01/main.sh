#!/bin/bash

 
. ./touch.sh




re='^[0-9]+$'
DATE=$(date +"%d %B %Y %T")

if [ $# -eq 6 ] && [[ ${6:2} -eq 'k' ]] || [[ ${6:3} -eq 'k' ]] ; # здесь проверка параметров

then
    IFS='k' read -ra kilobytes <<< "$6"
    IFS='.' read -ra file_and_filetype <<< "$5"
    if ! [ 1 == 1 ]; then
        echo "First parameter must be path with '/' in the end..."
        echo "Second parameter must be integer..."
        echo "Third parameter must be string..."
        echo "Fourth parameter must be integer..."
        echo "Fifth parameter must be with name no longer than 7 and file type name no longer than 3..."
        echo "Sixth parameter must be no larger than 100KB..."
    else
        if [[ ${#file_and_filetype[0]} < 4 ]] ; then
            first_name=${file_and_filetype[0]}
            first_name+=${first_name:0:1}
            first_name+=${first_name:0:1}
            first_name+=${first_name:0:1}
        fi
        dir_count=$2
        file_count=$4
        dir=$3
        path=$1
        today_day=$(date +%d) #здесь компиляция
        today_month=$(date +%m)
        year=$(date +%Y)
        second_name_of_file=$today_day$today_month$year
        filename=$3
        bomber_of_files #обращается в функци. в файле принта

    fi

else
    echo "The script takes only 6 parameters...."
    echo "Size of files only in kb... Example: '100kb'"
        
fi