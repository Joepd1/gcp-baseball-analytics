CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_pitch_types` AS
WITH
    distinct_pitch_types AS (
        SELECT DISTINCT
            pitchType as pitchTypeCode,
            pitchTypeDescription
        FROM
            `devoteam-tech-challenge-456311.baseball.stg_events`
        WHERE
            pitchTypeDescription != ""
    )
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            pitchTypeDescription
    ) - 1 AS pitchTypeId,
    pitchTypeCode,
    pitchTypeDescription
FROM
    distinct_pitch_types
ORDER BY
    pitchTypeId