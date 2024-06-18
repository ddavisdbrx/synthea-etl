# Databricks notebook source
# define widgets/parameters
dbutils.widgets.text("environment", "dev")
dbutils.widgets.text("debug", "true")

# assign widget values to variaables
if dbutils.widgets.get("environment") == 'dev':
  environment = '_dev'
else: environment = ''
debug = eval(dbutils.widgets.get('debug').title())
print(f"Target environment: {dbutils.widgets.get('environment')}")
print(f"Debug run: {debug}")

# COMMAND ----------

# create temp table
spark.sql(f"""
CREATE OR REPLACE TEMP VIEW source
AS
SELECT count(*) as encounters, cast(start_datetime as date) as encounter_date
FROM ddavis_demo{environment}.ddavis_encounters.silver_encounters
GROUP BY cast(start_datetime as date);
""")

# debug
if debug == True: 
  spark.table(f"source").display()

# COMMAND ----------

# create table if not exists
spark.sql(f"""
-- create table if not exists          
CREATE TABLE IF NOT EXISTS  ddavis_demo{environment}.ddavis_encounters.gold_aggregate_encounters
AS SELECT * FROM source;
""")


# upsert updates
spark.sql(f"""
MERGE INTO ddavis_demo{environment}.ddavis_encounters.gold_aggregate_encounters as target
USING source
ON target.encounter_date = source.encounter_date
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *;
""")

# debug
if debug == True: 
  spark.table(f"ddavis_demo{environment}.ddavis_encounters.gold_aggregate_encounters").display()
