# Databricks notebook source
dbutils.widgets.text("environment", "dev")
environment = "_" + dbutils.widgets.get("environment")
print(f"Target environment: {dbutils.widgets.get('environment')}")

# COMMAND ----------


spark.sql(f"""
CREATE OR REPLACE TEMP VIEW source
AS
SELECT count(*) as encounters, cast(start as date) as encounter_date
FROM ddavis_demo{environment}.ddavis_encounters.silver_encounters;
""")

# COMMAND ----------

spark.sql(f"""
-- create table if not exists          
CREATE TABLE IF NOT EXISTS  ddavis_demo{environment}.ddavis_encounters.gold_aggregae_encounters;

--merge updates
MERGE INTO ddavis_demo{environment}.ddavis_encounters.gold_aggregae_encounters as target
USING source
ON target.encounter_date = source.target_date
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *;
""")
