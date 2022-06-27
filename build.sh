#!/bin/bash

help() {

    echo "build.sh help
    
    This script uses docker containerization as the prefered and most reliable method for building and running the application. 
    However it's also designed to be able to install ruby3.0 natively 
    
    options:
    -h: shows this screen 
    --native: builds the application nativelly, without using docker
    "
    exit 0
}

nativeInstallation(){

    echo "Native install selected"
    echo ""
    echo "Installing ruby and bundler (sudo password needed for apt)"

    sudo apt update && sudo apt install -y ruby3.0 ruby-bundler build-essential ruby-dev ruby-railties
    bundle install    
}
normalInstallation(){
    docker -v >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        
        read -p 'Docker not installed. Do you wish to install docker?
        (This operation will use the convenience script at https://get.docker.com with sudo permissions) [y/N]' install_docker
        install_docker=${install_docker:-N}

        if [ $install_docker = 'y' ] || [ $install_docker = 'Y' ]; then
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            rm get-docker.sh
        else
            echo "If you don't wish to install docker, you can use the flag --native to install the necessary packages"
            exit 1
        fi
    fi

    docker -v >/dev/null 2>&1
    if [ $? = 0 ]; then
        sudo docker build -t salsify-line-test .
    else
        echo "docker installation not detected. Check if docker is installed with docker -v"
        exit 1
    fi
}

if [ "$1" = "-h" ] || [ "$1" = "?" ]; then
    help
fi

if [ "$1" = "--native" ]; then
    nativeInstallation
else
    normalInstallation
fi


echo "Environment ready. Execute run.sh [file].txt"
exit 0