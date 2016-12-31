#!/bin/bash

for ((i=0; i<16; i++)); do
    myip=$(ifconfig wlan0 | grep -oP "inet addr:\K\S+") && break
    sleep 1
done
    
cd $(dirname $0)
git pull
update_file=boot.log.$(hostname)
date > $update_file
sed -e 's/.\[32m//' -e 's/.\[0m//' /var/log/boot.log >> $update_file
echo "Host $(hostname) IP address $myip" >> $update_file
git commit -am "Updated $update_file"
git push origin
