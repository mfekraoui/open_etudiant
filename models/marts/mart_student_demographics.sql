{{ config(materialized='table') }}

SELECT
    REGION,
    GENDER,
    AGE_GROUP,
    YEAR_PATH_STARTED,
    COUNT(DISTINCT USER_ID) AS nb_students

FROM {{ ref('int_profils_enriched') }}

GROUP BY
    REGION,
    GENDER,
    AGE_GROUP,
    YEAR_PATH_STARTED