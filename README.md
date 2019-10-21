# Clickstream Data Pipeline

![datapipeline](https://raw.githubusercontent.com/devacto/ms/master/docs/images/moneysmart_data_architecture.png)

## Implementation Explanation

Most parts of the data architecture is implemented in this repository. Shell script that shows the different parts of the architecture can be found [here](https://github.com/devacto/ms/blob/master/bin/start). 

### Data Producer to Kafka

JSON data is being pumped into Kafka using a data producer which I developed and can be found [here](https://github.com/devacto/udp-data-producer).

### Clickstream Data in Kafka

As shown in the screenshot below, Clickstream data enters Kafka in real-time.

![clickstream_topic](https://raw.githubusercontent.com/devacto/ms/master/docs/images/clickstream_topic.png)

### Real-Time Processing of Clickstream Data using KSQL

Clickstream JSON data is being processed in real-time using KSQL, as shown below.

![ksql_clickstream_results](https://raw.githubusercontent.com/devacto/ms/master/docs/images/ksql_stream_results.png)

The KSQL script that does this can be found [here](https://github.com/devacto/ms/blob/master/ksql/clickstream-schema.sql).

### Pushing Data from Kafka to Cassandra using Kafka Connect Sink

Clickstream data from Kafka is being pushed to Cassandra in real-time using Kafka connect sink as shown below.

![connect_cassandra_sink](https://raw.githubusercontent.com/devacto/ms/master/docs/images/connect_cassandra_sink.png)

Configuration for this Kafka Connect component can be found [here](https://github.com/devacto/ms/blob/master/cassandra-sink/config.json). And shown in the screenshot below.

![connect_cassandra_sink_config](https://raw.githubusercontent.com/devacto/ms/master/docs/images/connect_cassandra_sink_config.png)

### Real-Time Monitoring of Data in Kafka

Screenshot of real-time monitoring of data in Kafka is shown below.

![clickstream_topic](https://raw.githubusercontent.com/devacto/ms/master/docs/images/clickstream_topic.png)

### Data Analysis using Datastax Notebook

Data in Cassandra can be easily analysed using a notebook as shown below.

![datastax_notebook](https://raw.githubusercontent.com/devacto/ms/master/docs/images/datastax_notebook.png)

### Infrastructure using docker-compose

All infrastructure for this exercise is spun up using docker-compose and can be found [here](https://github.com/devacto/ms/blob/master/docker-compose.yml).

## Instructions

### Step 1: Download Confluent Platform

Download Confluent Platform from [here](https://www.confluent.io/download/).

### Step 2: To start

Run `bin/start` from the terminal to start.

### Step 3: Check out Confluent Control Center

In your browser, go to `http://localhost:9021`