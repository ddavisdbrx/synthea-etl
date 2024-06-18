-- Databricks notebook source
-- MAGIC %python
-- MAGIC dbutils.widgets.text("environment", "dev")
-- MAGIC environment = dbutils.widgets.get("environment")

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW encounters
AS
SELECT count(*) as encounters, 

-- COMMAND ----------

select * from ddavis_demo.ddavis_encounters.bronze_encounters
