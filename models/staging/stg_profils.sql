{{ config(materialized='view') }}

SELECT DISTINCT
    USER_ID,

    TRIM(PATH_CATEGORY_NAME) AS PATH_CATEGORY_NAME,

    AGE_GROUP,

    CASE
        WHEN GENDER = 'M' THEN 'Male'
        WHEN GENDER = 'F' THEN 'Female'
        ELSE 'Other'
    END AS GENDER,

    REPLACE(
        REPLACE(
            REPLACE(REGION, 'ÃŽ', 'Î'),
            'Ã´', 'ô'
        ),
        'Ã©', 'é'
    ) AS REGION,

    YEAR_PATH_STARTED

FROM {{ source('etudiant', 'profils') }}

WHERE USER_ID IS NOT NULL