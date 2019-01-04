#!/bin/bash

for line in $(cat ./newuser.txt);do
 if [ $(grep -c "$line" /etc/passwd) -eq 0 ];then
  echo "The $user is not exists.Create it...."
  useradd -m -d /home/$line -g wheel $line
  usermod -A sshonly $line
  echo "12345678" | passwd --stdin $line
 else
  echo "The $line is exists,not Create"
 fi
done

if [ $? -eq 0 ];then
 echo "succ new user done."
 rm ./newuser.txt
else
 echo "Error add user error."
fi

for line in $(cat ./newoldusr.txt);do
 if [ $(grep -c "$line" /etc/passwd) -eq 0 ];then
  echo "The $user is not exists.not delete"
 else
  echo "The $line is exists,delete it."
  userdel -r $line
 fi
done
rm $0
exit 0
