#!/bin/bash
id=$(id -u)
if [ $id -ne 0 ]
then
echo "user is not super user"
return 1
fi
dnf install nginx -y
if [ $? -ne 0 ]
then
echo "enginix having some error"
else
echo "nginx got installed"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
echo "mysql installed"
else
echo "mysql got failed"
fi

dnf install nodejs -y
if [ $? -ne 0 ]
then
echo "nodejs installed"
else
echo "nodejs not installed"
fi
