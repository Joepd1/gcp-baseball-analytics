CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_outcomes` AS
WITH
    distinct_outcomes AS (
        SELECT DISTINCT
            outcomeId as outcomeCode,
            outcomeDescription
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_events`
        WHERE
            outcomeId != ""
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            outcomeCode
    ) - 1 AS outcomeId,
    outcomeCode,
    outcomeDescription
FROM
    distinct_outcomes
ORDER BY
    outcomeId