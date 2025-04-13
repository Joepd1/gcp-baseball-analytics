CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.test_gameIdsPivot_seasonId` AS
WITH
    new_season AS (
        SELECT
            GENERATE_UUID() AS new_seasonId
    )
SELECT
    s.gameId,
    GENERATE_UUID() AS new_gameId,
    ns.new_seasonId
FROM
    `devoteam-tech-challenge-456311.baseball.test_batch_schedules` s
    CROSS JOIN new_season ns