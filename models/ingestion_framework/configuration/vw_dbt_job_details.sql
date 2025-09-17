{{
    config(
        materialized='view',
        alias='VW_DBT_JOB_DETAILS',
        database=env_var("DBT_ENV_DB"),
        schema='CONFIGURATION'
    )
}}

SELECT 
MODEL_UID,
MODEL_JSON:"package_name"::string AS PROJECT_NAME,
MODEL_NAME,
MODEL_JSON:"original_file_path"::string AS MODEL_SQL_FILE_PATH,
MODEL_JSON:"config":"database"::string AS DATABASE_NAME,
MODEL_JSON:"config":"schema"::string AS SCHEMA_NAME,
MODEL_JSON:"alias"::string AS TABLE_NAME ,
MODEL_JSON:"meta":"job":"job_name"::string AS JOB_NAME,
MODEL_JSON:"meta":"job":"ingestion_tool_name"::string AS INGESTION_TOOL_NAME,
MODEL_JSON:"meta":"job":"cron_schedule"::string AS CRON_SCHEDULE,
MODEL_JSON:"meta":"job":"humanized_schedule"::string AS HUMANIZED_SCHEDULE
 FROM {{ ref("dbt_model_metadata")}}