{{ config(materialized='view') }}
SELECT
    AGE_GROUP,
    GENDER,
    REGION,
    YEAR_PATH_STARTED
FROM {{ ref('stg_profils') }}
WHERE YEAR_PATH_STARTED IS NOT NULL