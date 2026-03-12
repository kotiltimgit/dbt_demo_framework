{{
    config(
        materialized='dummy_materialization',
        alias='APPOINTMENT',
        database=target.database,
        schema='BRONZE'
    )
}}

SELECT 1

{#{ audit_logging_insert_macro() }#}

{#{ ingestion_json_macro() }#}

{#{{ file_archive_macro() }}#}

{#{ audit_logging_update_macro() }#}