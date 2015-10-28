#!/bin/sh
/bin/sh /data/bakup/master/data/bakup/svr_master/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_slave/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_platdb/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_redis/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_res1/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_res2/rsync.sh
/bin/sh /data/bakup/master/data/bakup/svr_res3/rsync.sh
