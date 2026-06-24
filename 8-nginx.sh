#!/bin/bash
id=$(id -u)
if [ $id -ne 0]
then
echo "user is not super user"
return 1
fi
dnf install nginx -y
if [ $? -eq 0]
then
echo "enginix having some error"
else
echo "nginx got installed
fi
