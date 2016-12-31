#!/bin/bash

cd $(dirname $0)
git pull
update_file=boot.log.$(hostname)
sed -e 's/.\[32m//' -e 's/.\[0m//' /var/log/boot.log > $update_file
myip.sh >> $update_file
git commit -am "Updated $update_file"
git push origin
