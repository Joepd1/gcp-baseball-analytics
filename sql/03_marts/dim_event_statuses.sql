CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_event_statuses` AS
WITH
    distinct_statuses AS (
        SELECT DISTINCT
            status
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_events`
        WHERE
            status != ""
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            status
    ) - 1 AS eventStatusId,
    status as eventStatus
FROM
    distinct_statuses
ORDER BY
    eventStatusId