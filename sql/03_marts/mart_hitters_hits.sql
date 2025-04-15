CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_hitters_hits` AS
WITH
    pitches as (
        SELECT
            g.seasonId,
            CASE
                WHEN e.inningHalf = "TOP" THEN g.homeTeamId
                WHEN e.inningHalf = "BOT" THEN g.awayTeamId
            END AS teamId,
            e.hitLocation,
            e.hitType
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_events` e
            LEFT JOIN `devoteam-tech-challenge-456311.baseball.fact_games` g ON e.gameId = g.gameId
            LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_pitch_types` pt ON e.pitchTypeId = pt.pitchTypeId
        WHERE
            e.eventTypeId = 2
    )
SELECT
    pitcherId as playerId,
    seasonId,
    teamId,
    pitchTypeDescription,
    pitchZone
FROM
    pitches