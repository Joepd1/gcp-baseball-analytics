CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.test_batch_schedules` AS
SELECT
    p.new_gameId as gameId,
    s.gameNumber,
    p.new_seasonId as seasonId,
    2024 AS year,
    s.type,
    s.dayNight,
    s.duration,
    s.duration_minutes,
    s.homeTeamId,
    s.homeTeamName,
    s.awayTeamId,
    s.awayTeamName,
    TIMESTAMP(
        DATETIME_ADD(DATETIME(s.startTime), INTERVAL 8 YEAR)
    ) AS startTime,
    s.status,
    TIMESTAMP(
        DATETIME_ADD(DATETIME(s.created), INTERVAL 8 YEAR)
    ) AS created,
FROM
    `devoteam-tech-challenge-456311.baseball.test_batch_schedules` s
    JOIN `devoteam-tech-challenge-456311.baseball.test_gameIdsPivot_seasonId` p ON s.gameId = p.gameId