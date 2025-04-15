CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_pitchers_on_teams` AS
WITH
    pitchers as (
        SELECT DISTINCT
            e.pitcherId as playerId,
            g.seasonId,
            CASE
                WHEN e.inningHalf = "TOP" THEN g.homeTeamId
                WHEN e.inningHalf = "BOT" THEN g.awayTeamId
            END AS teamId
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_events` e
            JOIN `devoteam-tech-challenge-456311.baseball.fact_games` g ON g.gameId = e.gameId
        WHERE
            e.pitcherId IS NOT NULL
            AND e.pitcherId != ""
    )
SELECT
    pi.playerId,
    p.firstName,
    p.lastName,
    pi.teamId,
    t.teamName,
    pi.seasonId,
    s.year
FROM
    pitchers pi
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_players` p ON pi.playerId = p.playerId
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_teams` t ON pi.teamId = t.teamId
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_seasons` s ON pi.seasonId = s.seasonId