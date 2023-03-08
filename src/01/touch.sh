#!/bin/bash

function random_string_name {
    local characters=$first_name

    local length=${#characters}

    if [[ $length -lt ${#characters} ]]; then
        echo 'Error'
        exit 1
    fi

    local shuffled_chars=$(echo $characters | fold -w1 | shuf | tr -d '\n')

    local unique_chars=${shuffled_chars:0:$length}

    local random_chars=$(echo $characters | fold -w1 | shuf | tr -d '\n')
    local remaining_length=$(( $length - ${#unique_chars} ))
    local remaining_chars=${random_chars:0:$remaining_length}

    random_string_filename="${unique_chars}${remaining_chars}"
}

function random_string_dir {
    local characters=$dir

    local length=${#characters}

    if [[ $length -lt ${#characters} ]]; then
        echo 'Error'
        exit 1
    fi

    local shuffled_chars=$(echo $characters | fold -w1 | shuf | tr -d '\n')

    local unique_chars=${shuffled_chars:0:$length}

    local random_chars=$(echo $characters | fold -w1 | shuf | tr -d '\n')
    local remaining_length=$(( $length - ${#unique_chars} ))
    local remaining_chars=${random_chars:0:$remaining_length}

    random_string_directory="${unique_chars}${remaining_chars}"
}

function bomber_of_files {
    cd $path

    local size=$(df -lh '/home' | awk '/G/ {print $4-=G}')

    local mem=${kilobytes[0]}
    local name=$first_name
    local type=${file_and_filetype[1]}
    local local_dir=$dir

    while [[ size > 60 ]]
    do
        creating_trees
        size=$(df -lh '/home' | awk '/G/ {print $4-=G}')
    done
}

function creating_trees {
    local local_file_count=$file_count
    local local_dir_count=$dir_count
    while  [[ $local_dir_count != 0 ]]
        do
            random_string_dir
            if [ -d "$dir$random_string_directory" ] ; then
                echo "Error! This directory is already exists...."
                exit 1
            fi
            mkdir $dir$random_string_directory
            cd $dir$random_string_directory
            while  [[ $local_file_count != 0 ]]
            do
                random_string_name
                if [ -f "$first_name$random_string_filename" ] ; then
                    echo "Error! This file is already exists..."
                    exit 1
                fi
                   
                fallocate -l $mem'KB' $first_name$random_string_filename'_'$second_name_of_file'.'$type
                local_file_count=$((local_file_count-1))
            done

            cd ..
            local_dir_count=$((local_dir_count-1))
        done
    cd $dir$random_string_directory
}
