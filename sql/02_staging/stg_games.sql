CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.stg_games` AS
    -- Combine raw games table with scheduls table for games in the regular season
    -- This adds a gameNumber, status and creationMoment
WITH
    reg_games AS (
        SELECT DISTINCT
            g.gameId,
            g.seasonId,
            g.seasonType,
            s.gameNumber,
            g.dayNight,
            s.startTime,
            g.duration,
            g.durationMinutes,
            g.attendance,
            g.venueId,
            g.homeTeamId,
            g.awayTeamId,
            g.homeFinalRuns,
            g.homeFinalHits,
            g.homeFinalErrors,
            g.awayFinalRuns,
            g.awayFinalHits,
            g.awayFinalErrors,
            s.status AS schedule_status,
            s.created AS schedule_created
        FROM
            -- Regular join because a match is required
            `devoteam-tech-challenge-456311.baseball.raw_games_wide` g
            JOIN `devoteam-tech-challenge-456311.baseball.raw_schedules` s ON g.gameId = s.gameId
    ),
    -- The games_post_wide table is extended with null for data that is not available
    post_games AS (
        SELECT DISTINCT
            gameId,
            seasonId,
            seasonType,
            CAST(NULL AS INT64) AS gameNumber,
            dayNight,
            startTime,
            duration,
            durationMinutes,
            attendance,
            venueId,
            homeTeamId,
            awayTeamId,
            homeFinalRuns,
            homeFinalHits,
            homeFinalErrors,
            awayFinalRuns,
            awayFinalHits,
            awayFinalErrors,
            CAST(NULL AS STRING) AS schedule_status,
            CAST(NULL AS TIMESTAMP) AS schedule_created
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_post_wide`
    )
SELECT
    *
FROM
    reg_games
UNION ALL
SELECT
    *
FROM
    post_games