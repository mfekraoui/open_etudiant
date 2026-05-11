{{ config(materialized='table') }}

SELECT
    REGION,
    GENDER,
    AGE_GROUP,
    YEAR_PATH_STARTED,
    COUNT(DISTINCT USER_ID) AS nb_students

FROM {{ ref('stg_profils') }}

GROUP BY
    REGION,
    GENDER,
    AGE_GROUP,
    YEAR_PATH_STARTED