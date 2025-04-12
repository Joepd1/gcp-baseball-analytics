CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.stg_games` AS
    -- Combine tables for regular season games and post-season games
WITH
    reg_games AS (
        SELECT DISTINCT
            g.gameId,
            g.seasonId,
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
            `devoteam-tech-challenge-456311.baseball.raw_games_wide` g
            JOIN `devoteam-tech-challenge-456311.baseball.raw_schedules` s ON g.gameId = s.gameId
    ),
    post_games AS (
        SELECT DISTINCT
            gameId,
            seasonId,
            NULL AS gameNumber,
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
            NULL AS schedule_status,
            NULL AS schedule_created
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