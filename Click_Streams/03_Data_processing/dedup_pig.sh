#!/bin/sh

hadoop fs -rm -r /etl/BI/casualcyclist/clicks/deduplogs/year=2016/month=05/day=05 || :

hadoop fs -mkdir -p /etl/BI/casualcyclist/clicks/deduplogs/year=2016/month=05
hadoop fs -chmod -R 1777 /etl/BI/casualcyclist/clicks/deduplogs

pig -x mapreduce -param raw_log_dir='/etl/BI/casualcyclist/clicks/rawlogs/year=2016/month=05/day=05' -param deduped_log_dir='/etl/BI/RCS/clicks/deduplogs/year=2016/month=05/day=05' dedup.pig
