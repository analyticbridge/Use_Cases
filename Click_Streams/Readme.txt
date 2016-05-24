To run the demo end-to-end: ( use teh cludera VM ) there is youtube link here .

we did mix up different tool just to have some fun on the way . spark is used for Production.

Run setup.sh to create the directory structure needed for the Demo .
if you ran this tutorial before, you'll want to run cleanup.sh first

Run 01_loggen/generate_apache_logs.sh - This will create an example clickstream log in /opt/weblogs 

next use Flume to ingest the logs we generated into Hadoop. detail instruction is in 02_ingestion/Flume/README 

Run 03_processing/01_dedup/pig/dedup.sh to remove duplicate events from the clickstream log ( dups due to ingestion tool) 

To enrich the data with information about user sessions using MapReduce , Code is in 03_processing/02_sessionization/mr/

Run 03_processing/03_paquetize/hive/run_all.sh to convert the sessionized data to Parquet format and to create the tables 

Run the query in 03_processing/04_query/query-parquet-log-table.hql using either Hive or Impala - this will give you the bounce-rate of your website for this day.

You can also run all the processing steps (dedup, sessionize and parquetize) automatically using an Oozie workflow. For that:

Run 04_orchestration/setup.sh to setup the Oozie library directory, and then upload the Hive and Pig scripts, the MapReduce jar and the Oozie workflow to HDFS. This is a requirement for running Oozie workflows.

Then run 04_orchestration/run.sh to trigger the workflow. Once the workflow is triggered, you can use Hue on the VM to watch the workflow dashboard and see its progress. When it finishes, you can query the data using Hive or Impala as mentioned above.

