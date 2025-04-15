CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_game_statuses` AS
WITH
    distinct_statuses AS (
        SELECT DISTINCT
            schedule_status
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_games`
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            schedule_status
    ) - 1 AS gameStatusId,
    schedule_status as game_status
FROM
    distinct_statuses