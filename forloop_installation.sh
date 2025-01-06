#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]
then
    echo "you are not a root user, please login as root user"
    exit 1
else
    dnf list installed mysql-server
    if [ $? -ne 0 ]
    then
        dnf install mysql-server -y
        if [ $? -ne 0 ]
        then
            echo "mysql-sever is not installed"
            exit 1
        else
            echo "mysql-sever is installed sucessfully"
        fi
    else
        echo "mysql-sever already installed!"
    fi
    dnf list installed git
    if [ $? -ne 0 ]
    then
        dnf install git -y
        if [ $? -ne 0 ]
        then
            echo "git is not installed"
            exit 1
        else
            echo "git is installed sucessfully"
        fi
    else
        echo "git already installed!"
    fi
fi


