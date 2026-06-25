#!/bin/bash
LOG="/var/logs/shellscript"
LOGFILE="/var/logs/shellscript/$0.log"

id=$(id -u)
if [ $id -ne 0 ]
then
echo "user is not super user" |tee -a $LGOFILE
exit 1
fi
mkdir -p LOG
validate(){
if [ $1 -eq 0 ]
then 
echo "$2 installed" | tee -a $LOGFILE
else
echo "$2 got failed" | tee -a $LOGFILE
fi
}

for package in {$@}
do
dnf list installed $package
if [$? -ne 0]
then
dnf install $package -y &>>$LOGFILE
validate $? "install $package"
else
echo "$package already installed"
fi
done



