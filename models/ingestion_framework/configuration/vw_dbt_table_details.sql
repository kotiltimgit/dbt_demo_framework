{{
    config(
        materialized='view',
        alias='VW_DBT_TABLE_DETAILS',
        database=env_var("DBT_ENV_DB"),
        schema='CONFIGURATION'
    )
}}

SELECT 
MODEL_UID,
MODEL_JSON:"package_name"::string AS PROJECT_NAME,
MODEL_NAME,
MODEL_JSON:"original_file_path"::string AS MODEL_SQL_FILE_PATH,
MODEL_JSON:"meta":"source_location_conf":"filename"::string AS FILENAME,
MODEL_JSON:"meta":"source_location_conf":"file_type"::string AS FILE_TYPE,
MODEL_JSON:"meta":"source_location_conf":"files"::string AS FILES,
MODEL_JSON:"meta":"source_location_conf":"pattern"::string AS PATTERN,
MODEL_JSON:"meta":"source_location_conf":"stage_landing_path"::string AS STAGE_LANDING_PATH,
MODEL_JSON:"meta":"source_location_conf":"stage_archive_path"::string AS STAGE_ARCHIVE_PATH,
MODEL_JSON:"meta":"source_location_conf":"stage_error_path"::string AS STAGE_ERROR_PATH,
MODEL_JSON:"meta":"source_location_conf":"stage_name"::string AS STAGE_NAME,
MODEL_JSON:"meta":"source_location_conf":"file_format"::string AS FILE_FORMAT,
MODEL_JSON:"meta":"source_location_conf":"copy_options"::string AS COPY_OPTIONS,
MODEL_JSON:"meta":"stage_table":"enabled"::string AS STAGE_TABLE_ENABLED,
MODEL_JSON:"meta":"stage_table":"database"::string AS STAGE_TABLE_DATABASE,
MODEL_JSON:"meta":"stage_table":"schema"::string AS STAGE_TABLE_SCHEMA,
MODEL_JSON:"meta":"stage_table":"stage_table_name"::string AS STAGE_TABLE_NAME,
MODEL_JSON:"meta":"raw_table":"primary_keys"::string AS PRIMARY_KEYS,
MODEL_JSON:"meta":"raw_table":"flatten"::string AS FLATTEN,
MODEL_JSON:"config":"database"::string AS DATABASE_NAME,
MODEL_JSON:"config":"schema"::string AS SCHEMA_NAME,
MODEL_JSON:"alias"::string AS TABLE_NAME
 FROM {{ ref("dbt_model_metadata")}}