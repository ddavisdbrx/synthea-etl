-- Databricks notebook source
-- MAGIC %md-sandbox
-- MAGIC ### 1/ Loading our data using Databricks Autoloader (cloud_files)
-- MAGIC
-- MAGIC   
-- MAGIC Our raw files are available in our landing zone as CSV. We need to ingest them at scale, while handling schema inference and evolution.
-- MAGIC Databricks Autoloader makes this very easy.
-- MAGIC
-- MAGIC For more details on autoloader, run `dbdemos.install('auto-loader')`

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_allergies
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/allergies/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_claims
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/claims/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_claims_transactions
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/claims_transactions/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_devices
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/devices/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_encounters
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/encounters/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_patients
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/patients/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_payer_transitions
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/payer_transitions/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_payers
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/payers/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_procedures
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/procedures/', 'csv')

-- COMMAND ----------

CREATE STREAMING LIVE TABLE bronze_providers
AS 
SELECT 
  * 
  ,cast(current_timestamp as date) as bronze_date
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_time
  ,to_date(current_timestamp, 'HH:mm:ss') as bronze_timestamp
  ,_metadata.file_name as input_file_name
  ,_metadata.file_path as input_file_path
  ,_metadata as file_metadata
FROM cloud_files('/Volumes/ddavis_demo/synthea/landing/providers/', 'csv')
