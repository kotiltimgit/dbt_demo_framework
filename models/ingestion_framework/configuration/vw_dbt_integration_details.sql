{{
    config(
        materialized='view',
        alias='VW_DBT_INTEGRATION_DETAILS',
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
MODEL_JSON:"meta":"integration":"integration_name"::string AS INTEGRATION_NAME,
MODEL_JSON:"meta":"integration":"integration_owner"::string AS INTEGRATION_OWNER,
MODEL_JSON:"meta":"integration":"integration_reporting_name"::string AS INTEGRATION_REPORTING_NAME,
MODEL_JSON:"meta":"integration":"integration_type"::string AS INTEGRATION_TYPE,
MODEL_JSON:"meta":"integration":"inbound"::string AS INBOUND,
MODEL_JSON:"meta":"integration":"active"::string AS ACTIVE
FROM {{ ref("dbt_model_metadata")}}
