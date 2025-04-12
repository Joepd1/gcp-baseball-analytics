CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.stg_players` AS
WITH
    hitters AS (
        SELECT
            hitterId AS playerId,
            hitterFirstName AS firstName,
            hitterLastName AS lastName,
            hitterWeight AS weight,
            hitterHeight AS height,
            hitterBatHand AS batHand,
            CAST(NULL AS STRING) AS throwHand
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_filtered`
        WHERE
            hitterId IS NOT NULL
            AND hitterId != ""
        UNION DISTINCT
        SELECT
            hitterId AS playerId,
            hitterFirstName AS firstName,
            hitterLastName AS lastName,
            hitterWeight AS weight,
            hitterHeight AS height,
            hitterBatHand AS batHand,
            CAST(NULL AS STRING) AS throwHand
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_post_wide`
        WHERE
            hitterId IS NOT NULL
            AND hitterId != ""
    ),
    pitchers AS (
        SELECT
            pitcherId AS playerId,
            pitcherFirstName AS firstName,
            pitcherLastName AS lastName,
            CAST(NULL AS INT64) AS weight,
            CAST(NULL AS INT64) AS height,
            CAST(NULL AS STRING) AS batHand,
            pitcherThrowHand AS throwHand
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_filtered`
        WHERE
            pitcherId IS NOT NULL
            AND pitcherId != ""
        UNION DISTINCT
        SELECT
            pitcherId AS playerId,
            pitcherFirstName AS firstName,
            pitcherLastName AS lastName,
            CAST(NULL AS INT64) AS weight,
            CAST(NULL AS INT64) AS height,
            CAST(NULL AS STRING) AS batHand,
            pitcherThrowHand AS throwHand
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_post_wide`
        WHERE
            pitcherId IS NOT NULL
            AND pitcherId != ""
    )
SELECT
    playerId,
    ANY_VALUE(firstName) AS firstName,
    ANY_VALUE(lastName) AS lastName,
    MAX(weight) AS weight,
    MAX(height) AS height,
    ANY_VALUE(batHand) AS batHand,
    ANY_VALUE(throwHand) AS throwHand
FROM
    (
        SELECT
            *
        FROM
            hitters
        UNION ALL
        SELECT
            *
        FROM
            pitchers
    )
GROUP BY
    playerId;