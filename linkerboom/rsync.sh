#rsync -avz -e ssh  --force --delete  --ignore-errors  root@client.bak:/Backup/ /Backup/
LOG=/logs/rsync_bak_linkerboom.log
echo "==========Begin rsync: `date`===========" >>$LOG 2>&1 
rsync -Pav   --force --delete  --ignore-errors  client.bak:/Backup/  /Backup/ >> $LOG 2>&1
echo "==========End rsync: `date`===========" >>$LOG 2>&1 
