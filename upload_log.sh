#!/bin/sh

cd $(dirname)
git pull
cat /var/log/boot.log > boot.log.$(hostname)
git commit
git push origin
