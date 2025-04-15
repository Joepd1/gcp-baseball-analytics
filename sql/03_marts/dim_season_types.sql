CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_season_types` AS
WITH
    distinct_types AS (
        SELECT
            seasonType,
            MIN(startTime) AS first_seen
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_games`
        GROUP BY
            seasonType
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            first_seen
    ) - 1 AS seasonTypeId,
    seasonType
FROM
    distinct_types