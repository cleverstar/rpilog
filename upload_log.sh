#!/bin/bash

for ((i=0; i<10; i++)); do
    myip=$(ifconfig wlan0 | grep -oP "inet addr:\K\S+") 
    if [ "$myip" != "" ]; then
        break
    else
        sleep 1
    fi
done
    
cd $(dirname $0)
git pull
update_file=boot.log.$(hostname)
sed -e 's/.\[32m//' -e 's/.\[0m//' /var/log/boot.log > $update_file
echo "My IP address is $myip" >> $update_file
git commit -am "Updated $update_file"
git push origin
