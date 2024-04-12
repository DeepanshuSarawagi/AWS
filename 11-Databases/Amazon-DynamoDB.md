# Brief document highlighting Amazon DynamoDB

## Introduction:

- DynamoDB is a NoSQL DB, which means it doesn't use the common structured query language.
- Instead, it falls into the category of databases known as Key-Value stores.
- There is no disk space to provision.
- The data can be looked up using primary key of each item or through the index.
- DynamoDB tables are considered as schemaless.
- Secondary indexes of an item in a table can be used to perform queries on attributes
  that are not part of the table's primary key.
- If you want to query and match on different columns, you need to create an index
  that can do properly.
- When you write your queries you can specify which index should be used for each query.
- DynamoDB has two different types of indexes:
- **Global indexes** - 
  - Lets you query across the entire table to find any record that matched a particular value.
  - Can be defined after the table is created.
- **Local indexes** - 
  - Can only help find data within a single partition key.
  - Select an alternative sort key.
  - Must be defined during the table creation.
- When we create a DynamoDB table, **Amazon will reserve 5 read capacity units and 5
  write capacity units.**
- Supports transactions across multiple tables. (ACID support)
- **Table classes:** Standard and IA access.

## Data Types Supported:

### Scalar Types:
- String
- Number
- Binary
- Boolean
- Null

### Document Types:
- List
- Map

### Set Types:
- String Set
- Number Set
- Binary Set

## Capacity Mode:

### Provisioned Read/Write mode: 
- Allows you to provision, set read and writes allowed against your database per second by your application
- Depending on the transaction, each action will use 1 or more RCUs or WCUs.
- Auto-Scaling can be enabled with Provisioned Capacity mode.

### On-Demand mode: 

- They are scaled on demand. 
- This mode is generally used, when you are not aware of the load.


## Features:
- DynamoDB is highly reliable. The data replication is between three availability
  zones within a region which happens in milliseconds.
- DynamoDB can allow upto Maximum record size of 400 KB and upto 20 global indexes
  and 5 secondary per table.
- **DynamoDB Global Tables** - 
  - Makes a DynamoDB tables accessible from multiple regions and the data replication will be a two-way replication. 
  - To do this we need to enable DynamoDB Streams.
- **DynamoDB TTL** - Automatically delete items after an expiry timestamp.
- **DynamoDB Transactions** - 
  - If there is an attribute/column which is common in two or more tables. 
  - And if you want to sync the data between these two tables then using DynamoDB transactions, data will be written to all the two or tables
    or it will be written to None.
- **DynamoDB Stream:**
  - React to changes to DynamoDB table in real time.
  - Can be read by EC2, Lambda
  - 24 hours retention of data.

## Partition Keys:

### Option1:

- Partition key must be unique for each item.
- It must be diverse so that the data is distributed.
  - **Example:** `user_id` is a great partition key for table of users.

### Option2:

- Partition key + Sort key.
- The combination must be unique.
  - The partition can be repeated as long as the sort key associated with it is unique.
- Data is grouped by partition key.
- Sort key == Range key
- Example: Users games table
  - `user_id` can be the partition key
  - `game_id` can be the sort key

### Amazon Kinesis Data Streams for DynamoDB:
- You can use Kinesis Data Streams to capture item level changes in DynamoDB.
- Custom and longer data retention period.
- DynamoDB will push the item level changes to Kinesis Data Streams.
  - From there on, Kinesis Data Firehose can read this data and store this data to S3, RedShift or OpenSearch.
  - Or you can read this data using Kinesis Data Analytics and perform some real-time analytics.
  - Real time computation such as filter, aggregate, transform. Can send the transformed data to Kinesis Data Streams, Kinesis Data Firehose, Lambda.

