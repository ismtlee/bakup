#!/bin/sh 
#export RSYNC_PASSWORD=passwd 
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin 

# 设置远程服务器与需要备份的目录
SERVER=bak_usr@res1.server
DIR=(cellar scripts deploy nginx cron sys_etc usr_etc) 

# 设置客户端上的用于备份的目录
BDIR=/Backup
BASE=Current/$SERVER
BAK_FILES=BAK_FILES
INCREMENTDIR=`date +%Y-%m-%d` 

# 在客户端灵活使用 exclude 功能；设置日志
EXCLUDES=/etc/rsyncd/excludes
LOG=/logs/rsync_bak_res1.log 

# 参数设置，调用 backup-dir 将服务器端的增量文件存储到 INCREMENTDIR 目录下
OPTS="-avz --force --delete --exclude-from=$EXCLUDES --password-file=/etc/rsyncd/rsync.password --ignore-errors -b  --backup-dir=$BDIR/$INCREMENTDIR/$SERVER"
#OPTS="-avz--force --delete --delete-excluded  --exclude-from=$EXCLUDES -b  --backup-dir=$BDIR/$INCREMENTDIR --ignore-errors"

# 确保客户端上的用于备份的目录存在
install -d $BDIR/$BASE 

# 实现数据备份与同步，将日志邮寄给 root 用户
run_rsync() 
{ 
 echo "==========Begin rsync: `date`===========" >>$LOG 2>&1 
 du -s $BDIR/* >>$LOG 2>&1 
 
 for ary in ${DIR[@]} 
 do 
    rsync $OPTS/$ary $SERVER::$ary $BDIR/$BASE/$ary >> $LOG 2>&1
    #rsync $OPTS $SERVER::$ary $BDIR/$BASE  >>$LOG 2>&1 
 done

 #rsync $OPTS $SERVER::$DIR $BDIR/$BASE  >>$LOG 2>&1 
 echo "==========End rsync: `date`===========" >>$LOG 2>&1 
 #mail root -s "Backup Report" < $LOG 
 #rm $LOG 
} 

run_rsync

# 条件测试，运行程序
#if [ -f $EXCLUDES ]; then 
       #if [ -d $BDIR ]; then 
               #run_rsync 
       #else 
               #echo "cant find $BDIR"; exit 
       #fi 
       #else 
               #echo "cant find $EXCLUDES"; exit 
#fi

