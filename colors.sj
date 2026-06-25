#!/bin/bash
R="\e[31m"
G="\e[32m"
y="\e[33m"
n="\e[0m"

#!/bin/bash
LOG="/var/logs/shellscript"
LOGFILE="/var/logs/shellscript/$0.log"

id=$(id -u)
if [ $id -ne 0 ]
then
echo -e "$R user is not super user $n" |tee -a $LOGFILE
exit 1
fi
mkdir -p LOG
validate(){
if [ $1 -eq 0 ]
then 
echo -e "$G$2 installed$n" | tee -a $LOGFILE
else
echo "$R$2 got failed$n" | tee -a $LOGFILE
fi
}

for package in $@
do
dnf list installed $package &>>$LOGFILE
if [ $? -ne 0 ]
then
dnf install $package -y &>>$LOGFILE
validate $? "install $package"
else
echo -e "$y$package already installed$n"
fi
done



