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
dnf install nginx -y &>>$LOGFILE
echo "value $?"
validate $? "install nginx"

dnf install mysql -y &>>$LOGFILE
validate $? "install mysql"

dnf install nodejs -y &>>$LOGFILE
validate $? "install nodejs"


