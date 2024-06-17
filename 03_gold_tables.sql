-- Databricks notebook source

-- create a type 2 dimension for dim_cpt
CREATE OR REFRESH STREAMING TABLE gold_patient_testing;
APPLY CHANGES INTO
  live.gold_patient_testing
FROM stream(live.silver_patients)
KEYS
  (id)
SEQUENCE BY
  silver_timestamp
STORED AS
  SCD TYPE 2
