# Databricks notebook source
# MAGIC %sql
# MAGIC drop table ddavis_demo.ddavis_encounters.silver_patient

# COMMAND ----------

df = spark.sql('select * from ddavis_demo.ddavis_encounters.bronze_patients')
df.columns


