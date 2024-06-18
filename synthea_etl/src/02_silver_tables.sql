-- Databricks notebook source
-- DBTITLE 1,Streaming Live Allergy Data
CREATE STREAMING LIVE TABLE silver_allergies (
  CONSTRAINT `Patient is not null` EXPECT (patient IS NOT NULL)
)
AS
SELECT
  START AS start,
  STOP AS stop,
  PATIENT AS patient,
  ENCOUNTER AS encounter,
  CODE AS code,
  SYSTEM AS system,
  DESCRIPTION AS description,
  TYPE AS type,
  CATEGORY AS category,
  REACTION1 AS reaction_1,
  DESCRIPTION1 AS description_1,
  SEVERITY1 AS severity_1,
  REACTION2 AS reaction_2,
  DESCRIPTION2 AS description_2,
  SEVERITY2 AS severity_2,
  bronze_date,
  bronze_time,
  bronze_timestamp,
  input_file_name,
  input_file_path,
  file_metadata
FROM
  stream(live.bronze_allergies)

-- COMMAND ----------

CREATE STREAMING LIVE TABLE silver_patients (
  CONSTRAINT `Id is not null` EXPECT (id IS NOT NULL) ON VIOLATION DROP ROW
)
AS
SELECT
  id,
  birthdate,
  deathdate,
  ssn,
  drivers as drivers_license,
  passport,
  prefix,
  first,
  middle,
  last,
  suffix,
  maiden as maiden_name,
  marital as marital_status,
  race,
  ethnicity,
  gender,
  birthplace,
  address,
  city,
  state,
  county,
  fips,
  zip as zip_code,
  lat as latitude,
  lon as longitude,
  healthcare_expenses,
  healthcare_coverage,
  income,
  _rescued_data,
  bronze_date,
  bronze_time,
  bronze_timestamp,
  cast(current_timestamp as date) as silver_date,
  to_date(current_timestamp, 'HH:mm:ss') as silver_time,
  current_timestamp as silver_timestamp,
  input_file_name,
  input_file_path,
  file_metadata
FROM
  stream(live.bronze_patients)

-- COMMAND ----------

CREATE STREAMING LIVE TABLE silver_encounters (
  CONSTRAINT `Patient is not null` EXPECT (patient IS NOT NULL)
)
AS
SELECT
  id,
  START AS start_datetime,
  STOP AS stop_datetime,
  PATIENT AS patient,
  ORGANIZATION as organization,
  PROVIDER as provider,
  PAYER as payer,
  ENCOUNTERCLASS as encounter_class,
  CODE as code,
  DESCRIPTION as description,
  BASE_ENCOUNTER_COST as base_encounter_cost,
  TOTAL_CLAIM_COST as total_claim_cost,
  PAYER_COVERAGE as payer_coverage,
  REASONCODE as reason_code,
  REASONDESCRIPTION as reason_description,
  bronze_date,
  bronze_time,
  bronze_timestamp,
  input_file_name,
  input_file_path,
  file_metadata
FROM
  stream(live.bronze_allergies)
