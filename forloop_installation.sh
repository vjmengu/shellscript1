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
        dnf install mysql-sever -y
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
fi


