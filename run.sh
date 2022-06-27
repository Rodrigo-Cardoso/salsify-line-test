#!/bin/bash

nativeRun(){
    echo "Running rails server nativelly"
    rails s 
}

dockerRun (){
    echo "Docker image detected. Launching docker container"
    sudo docker run -d --rm --name salsify-line-test -v ${PWD}:/var/app -p 3000:3000 salsify-line-test:latest
    if [ $? -ne 0 ]; then
        nativeRun
    else
        exit 0
    fi
}

getFile()
{
    # checking file exist or not
    if [ ! -f $1 ]; then
        echo "$1: does not exists"
        exit 1
    elif [ ! -r $1 ]; then
        echo "$1: can not read"
        exit 1
    fi
    
    if [[ ! $( file --mime-type -b $1 ) == "text/plain" ]] && [[ ! $( file --mime-type -b $1 ) == "inode/x-empty" ]]; then
        echo "$1: File Type Invalid"
        exit 1
    fi
    rm public/files/line_file.txt &>/dev/null
    cp $1 public/files/line_file.txt
    
}

if [ ! $1 ]; then 
    echo "Error: No File"
    exit 1
fi
getFile $1
rm tmp/pids/server.pid &>/dev/null

docker -v &>/dev/null
    if [ $? -ne 0 ]; then
        sudo docker image inspect salsify-line-test:latest &>/dev/null
        if [ $? == 0 ]; then
            dockerRun
        fi
    fi
nativeRun
exit 0