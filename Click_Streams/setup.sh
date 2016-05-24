#!/bin/bash
hadoop fs -mkdir -p /etl/BI/rcs/clicks/rawlogs
hadoop fs -chmod 1777 /etl/BI/rcs/clicks/rawlogs

hadoop fs -mkdir -p /etl/BI/rcs/clicks/sessionizedlogs/year=2016/month=05/
hadoop fs -chmod 1777 /etl/BI/rcs/clicks/sessionizedlogs/year=2016/month=05/

hadoop fs -mkdir -p /data/shop/clickstream
hadoop fs -chmod 1777 /data/shop/clickstream

hadoop fs -mkdir -p /user/$USER
hadoop fs -chown $USER:$USER /user/$USER

sudo mkdir /opt/weblogs
sudo chmod 777 /opt/weblogs

sudo mkdir /opt/flume
sudo chmod 1777 /opt/flume
