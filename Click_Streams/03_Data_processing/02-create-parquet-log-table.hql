CREATE EXTERNAL TABLE if not exists apache_log_parquet(
        IP              STRING,
        t	        STRING,
        URL             STRING,
        referrer        STRING,
        user_agent      STRING,
	ts		BIGINT,
	session_id	INT)
PARTITIONED BY (
	year            INT,
	month 		INT,
	day 		INT)
ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
STORED AS
INPUTFORMAT "parquet.hive.DeprecatedParquetInputFormat"
OUTPUTFORMAT "parquet.hive.DeprecatedParquetOutputFormat"
LOCATION '/data/shop/clickstream';