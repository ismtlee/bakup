#rsync -avz -e ssh  --force --delete  --ignore-errors  root@client.bak:/Backup/ /Backup/
rsync -Pav   --force --delete  --ignore-errors  client.bak:/Backup/  /Backup/
