CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_event_types` AS
WITH
    distinct_event_types AS (
        SELECT DISTINCT
            inningEventType as eventType,
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_events`
        WHERE
            inningEventType IS NOT NULL
            AND inningEventType != ""
        UNION ALL
        SELECT DISTINCT
            atBatEventType as eventType,
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_events`
        WHERE
            atBatEventType IS NOT NULL
            AND atBatEventType != ""
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            eventType
    ) - 1 AS eventTypeId,
    eventType
FROM
    distinct_event_types
ORDER BY
    eventTypeId