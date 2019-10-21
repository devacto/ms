set 'commit.interval.ms'='2000';
set 'cache.max.bytes.buffering'='10000000';
set 'auto.offset.reset'='earliest';

-- 1. SOURCE of ClickStream
CREATE STREAM clickstream (session_id varchar, user_id varchar, partner_name varchar, page_type varchar, init_session varchar, date bigint, user_agent varchar, city varchar, current_url varchar, referrer varchar, language varchar) with (kafka_topic = 'clickstream', value_format = 'json', timestamp='date');

-- 2. Convert to AVRO
CREATE STREAM clickstream_avro WITH (KAFKA_TOPIC='clickstream_avro',VALUE_FORMAT='AVRO') AS SELECT * FROM clickstream PARTITION BY user_id;