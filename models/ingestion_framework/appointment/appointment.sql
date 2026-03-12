<<<<<<< HEAD
{{
    config(
        materialized='dummy_materialization',
        alias='APPOINTMENT',
        database=env_var('DBT_ENV_DB'),
        schema='BRONZE'
    )
}}

{{ audit_logging_insert_macro() }}

{{ ingestion_json_macro() }}

{{{ file_archive_macro() }}}

{{ audit_logging_update_macro() }}
=======
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
>>>>>>> ac6d9d8a5b20899cef8543877c85ce46e95878dd
