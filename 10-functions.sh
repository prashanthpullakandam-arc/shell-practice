#!/bin/bash
id=$(id -u)
if [ $id -ne 0 ]
then
echo "user is not super user"
return 1
fi

validate(){
if [ $1 -ne 0 ]
then 
echo "$2 installed"
else
echo "$2 got failed"
fi
}
dnf install nginx -y
validate $? "install nginx"

dnf install mysql -y
validate $? "install mysql"

dnf install nodejs -y
validate $? "install nodejs"


