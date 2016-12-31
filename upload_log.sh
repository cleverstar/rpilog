#!/bin/sh

cd $(dirname)
git pull
update_file=boot.log.$(hostname)
cat /var/log/boot.log > $update_file
myip.sh >> $uplodate_file
git commit -am "Updated $update_file"
git push origin
