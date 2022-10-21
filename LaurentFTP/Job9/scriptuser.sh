#!/bin/bash

while read ligne; do
user=`echo "$ligne" | cut -d, -f 1`
mdp=`echo "$ligne" | cut -d, -f 2`
role=`echo "$ligne" | cut -d -f 3`
sudo useradd "$user" 
echo "$user":"$mdp"::::/home/"$user" | sudo chpasswd
done < /home/law/LaurentFTP/Job9/Users.txt

if [ "$role" == "admin" ];then
sudo sed -l'/law ALL=(ALL:ALL) ALL/a\$user ALL=(ALL:ALL) ALL' /etc/sudoers
fi
