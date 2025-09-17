{{
    config(
        materialized='view',
        alias='VW_DBT_COLUMN_DETAILS',
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
MODEL_JSON:"alias"::string AS TABLE_NAME,
MODEL_JSON:"columns"::string AS COLUMNS,
--t1.value,
--t1.value:"name"::string AS COLUMN_NAME,
t1.value:"meta":"contains_pii"::string AS CONTAINS_PII,
t1.value:"meta":"path"::string AS PATH,
t1.value:"meta":"sql_column_datatype"::string AS SQL_COLUMN_DATATYPE,
t1.value:"meta":"source_column"::string AS SQL_COLUMN,
t1.value:"meta":"copy_transformation_logic"::string AS COPY_TRANSFORMATION_LOGIC,
t1.value:"meta":"transformation_logic"::string AS TRANSFORMATION_LOGIC,
 FROM {{ ref("dbt_model_metadata")}} MTD,
lateral flatten( input => MTD.MODEL_JSON:"columns" ) t1