CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_pitchers` AS
WITH
    pitches as (
        SELECT
            e.gameId,
            g.seasonId,
            CASE
                WHEN e.inningHalf = "TOP" THEN g.homeTeamId
                WHEN e.inningHalf = "BOT" THEN g.awayTeamId
            END AS teamId,
            e.pitcherId,
            e.is_hit as hits,
            CASE
                WHEN e.outcomeId = 8 THEN 1
                ELSE 0
            END as homeruns,
            CASE
                WHEN e.outcomeId = 24 THEN 1
                WHEN e.outcomeId = 36 THEN 1
                ELSE 0
            END as walks,
            CASE
                WHEN e.outcomeId = 28 THEN 1
                WHEN e.outcomeId = 37 THEN 1
                ELSE 0
            END as strikeOuts,
            CASE
                WHEN is_ab = 0 THEN 0
                WHEN e.outcomeId = 24 THEN 0
                WHEN e.outcomeId = 26 THEN 0
                WHEN e.outcomeId = 7 THEN 0
                ELSE 1
            END as atBats,
            (e.outs - e.startingOuts) as outsGainded,
            e.pitchSpeed,
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_events` e
            LEFT JOIN `devoteam-tech-challenge-456311.baseball.fact_games` g ON e.gameId = g.gameId
        WHERE
            eventTypeId = 2
    ),
    cumulated as (
        SELECT
            p.pitcherId,
            p.seasonId,
            p.teamId,
            COUNT(DISTINCT p.gameId) as games,
            SUM(p.hits) as hitsAllowed,
            sum(p.homeruns) as homerunsAllowed,
            sum(p.walks) as walks,
            sum(p.strikeOuts) as strikeOuts,
            sum(p.atBats) as atBats,
            sum(p.outsGainded) as outs,
            ROUND(SAFE_DIVIDE(sum(p.pitchSpeed), count(*)), 3) as averageSpeed,
        FROM
            pitches p
        GROUP BY
            pitcherId,
            seasonId,
            teamId
    )
SELECT
    c.pitcherId as playerId,
    c.seasonId,
    c.teamId,
    pl.firstName,
    pl.lastName,
    pl.throwHand,
    c.games,
    c.hitsAllowed,
    c.homerunsAllowed,
    c.walks,
    c.strikeOuts,
    c.atBats,
    c.outs,
    ROUND(SAFE_DIVIDE(c.hitsAllowed, c.atBats), 3) AS AVGAgainst,
    ROUND(SAFE_DIVIDE(c.outs, 3), 3) AS IP,
    ROUND(
        SAFE_DIVIDE(
            (c.walks + c.hitsAllowed),
            ROUND(SAFE_DIVIDE(c.outs, 3), 3)
        ),
        3
    ) AS WHIP,
    c.averageSpeed,
FRom
    cumulated c
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_players` pl ON c.pitcherId = pl.playerId