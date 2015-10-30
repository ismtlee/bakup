#!/bin/sh 
#export RSYNC_PASSWORD=passwd 
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin 

# 设置远程服务器与需要备份的目录
SERVER=root@client.bak
DIR=(linkerboom) 

rsync -avz -e ssh  --force --delete  --ignore-errors  root@client.bak:/Backup /Backup
