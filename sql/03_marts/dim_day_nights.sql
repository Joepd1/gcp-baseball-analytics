CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_day_nights` AS
WITH
    distinct_times AS (
        SELECT
            dayNight,
            MIN(TIME(startTime)) AS earliest
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_games`
        GROUP BY
            dayNight
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            earliest
    ) - 1 AS dayNightId,
    dayNight
FROM
    distinct_times