#!/bin/sh
#0 0 * * * /bin/sh  /data/bakup/cron.sh
/bin/sh /data/bakup/svr_master/rsync.sh
#slave has been migrated to svr_platdb
#/bin/sh /data/bakup/svr_slave/rsync.sh
/bin/sh /data/bakup/svr_platdb/rsync.sh
/bin/sh /data/bakup/svr_redis/rsync.sh
/bin/sh /data/bakup/svr_res1/rsync.sh
/bin/sh /data/bakup/svr_res2/rsync.sh
#res3 has been canceled
#/bin/sh /data/bakup/svr_res3/rsync.sh
