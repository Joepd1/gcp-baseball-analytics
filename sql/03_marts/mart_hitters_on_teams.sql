CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_hitters_on_teams` AS
WITH
    hitters as (
        SELECT DISTINCT
            e.hitterId as playerId,
            g.seasonId,
            CASE
                WHEN e.inningHalf = "TOP" THEN g.awayTeamId
                WHEN e.inningHalf = "BOT" THEN g.homeTeamId
            END AS teamId
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_events` e
            JOIN `devoteam-tech-challenge-456311.baseball.fact_games` g ON g.gameId = e.gameId
        WHERE
            e.hitterId IS NOT NULL
            AND e.hitterId != ""
    )
SELECT
    b.playerId,
    p.firstName,
    p.lastName,
    b.teamId,
    t.teamName,
    b.seasonId,
    s.year
FROM
    hitters b
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_players` p ON b.playerId = p.playerId
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_teams` t ON b.teamId = t.teamId
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_seasons` s ON b.seasonId = s.seasonId