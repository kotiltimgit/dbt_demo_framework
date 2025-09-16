{{
    config(
        materialized='dummy_materialization',
        alias='DBT_MODEL_METADATA',
        database=env_var("DBT_ENV_DB"),
        schema='CONFIGURATION'
    )
}}

{{ load_dbt_model_metadata() }}