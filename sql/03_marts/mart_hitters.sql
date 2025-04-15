CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_hitters` AS
WITH
    hitters as (
        SELECT
            e.gameId,
            g.seasonId,
            CASE
                WHEN e.inningHalf = "TOP" THEN g.awayTeamId
                WHEN e.inningHalf = "BOT" THEN g.homeTeamId
            END AS teamId,
            e.hitterId,
            CASE
                WHEN e.outcomeId = 14 THEN 1
                WHEN e.outcomeId = 15 THEN 1
                WHEN e.outcomeId = 16 THEN 1
                WHEN e.outcomeId = 17 THEN 1
                WHEN e.outcomeId = 3 THEN 1
                WHEN e.outcomeId = 4 THEN 1
                WHEN e.outcomeId = 5 THEN 1
                WHEN e.outcomeId = 22 THEN 1
                WHEN e.outcomeId = 23 THEN 1
                WHEN e.outcomeId = 8 THEN 1
                ELSE 0
            END as hits,
            CASE
                WHEN e.outcomeId = 24 THEN 1
                WHEN e.outcomeId = 26 THEN 1
                ELSE 0
            END as walks,
            CASE
                WHEN e.outcomeId = 38 THEN 1
                WHEN e.outcomeId = 37 THEN 1
                ELSE 0
            END as strikeOuts,
            CASE
                WHEN e.outcomeId = 14 THEN 1
                WHEN e.outcomeId = 15 THEN 1
                WHEN e.outcomeId = 16 THEN 1
                WHEN e.outcomeId = 17 THEN 1
                WHEN e.outcomeId = 3 THEN 1
                WHEN e.outcomeId = 4 THEN 1
                WHEN e.outcomeId = 5 THEN 1
                WHEN e.outcomeId = 22 THEN 1
                WHEN e.outcomeId = 23 THEN 1
                WHEN e.outcomeId = 8 THEN 1
                WHEN e.outcomeId = 11 THEN 1
                WHEN e.outcomeId = 12 THEN 1
                WHEN e.outcomeId = 13 THEN 1
                WHEN e.outcomeId = 6 THEN 1
                WHEN e.outcomeId = 12 THEN 1
                WHEN e.outcomeId = 13 THEN 1
                WHEN e.outcomeId = 36 THEN 1
                WHEN e.outcomeId = 35 THEN 1
                WHEN e.outcomeId = 40 THEN 1
                WHEN e.outcomeId = 39 THEN 1
                WHEN e.outcomeId = 33 THEN 1
                WHEN e.outcomeId = 34 THEN 1
                WHEN e.outcomeId = 32 THEN 1
                WHEN e.outcomeId = 41 THEN 1
                WHEN e.outcomeId = 44 THEN 1
                WHEN e.outcomeId = 45 THEN 1
                WHEN e.outcomeId = 46 THEN 1
                WHEN e.outcomeId = 37 THEN 1
                WHEN e.outcomeId = 38 THEN 1
                WHEN e.outcomeId = 24 THEN 1
                WHEN e.outcomeId = 7 THEN 1
                WHEN e.outcomeId = 2 THEN 1
                WHEN e.outcomeId = 20 THEN 1
                WHEN e.outcomeId = 21 THEN 1
                WHEN e.outcomeId = 43 THEN 1
                WHEN e.outcomeId = 18 THEN 1
                WHEN e.outcomeId = 19 THEN 1
                WHEN e.outcomeId = 42 THEN 1
                ELSE 0
            END as atBats,
            CASE
                WHEN e.outcomeId = 14 THEN 1
                ELSE 0
            END AS singles,
            CASE
                WHEN e.outcomeId = 3 THEN 1
                ELSE 0
            END AS doubles,
            CASE
                WHEN e.outcomeId = 22 THEN 1
                ELSE 0
            END AS triples,
            CASE
                WHEN e.outcomeId = 8 THEN 1
                ELSE 0
            END AS homeruns,
            CASE
                WHEN e.outcomeId = 7 THEN 1
                ELSE 0
            END AS HBP,
            CASE
                WHEN e.outcomeId = 2 THEN 1
                ELSE 0
            END AS CI,
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_events` e
            LEFT JOIN `devoteam-tech-challenge-456311.baseball.fact_games` g ON e.gameId = g.gameId
        WHERE
            eventTypeId = 2
    ),
    cumulated as (
        SELECT
            h.hitterId,
            h.seasonId,
            h.teamId,
            COUNT(DISTINCT h.gameId) as games,
            SUM(h.hits) as hits,
            sum(h.walks) as walks,
            sum(h.strikeOuts) as strikeOuts,
            sum(h.atBats) as atBats,
            sum(h.singles) as singles,
            sum(h.doubles) as doubles,
            sum(h.triples) as triples,
            sum(h.homeruns) as homeruns,
            sum(h.HBP) as HBP
        FROM
            hitters h
        GROUP BY
            hitterId,
            seasonId,
            teamId
    )
SELECT
    c.hitterId as playerId,
    c.seasonId,
    c.teamId,
    pl.firstName,
    pl.lastName,
    pl.batHand,
    c.games,
    c.hits,
    c.walks,
    c.strikeOuts,
    c.atBats,
    c.singles,
    c.doubles,
    c.triples,
    c.homeruns,
    c.HBP
FRom
    cumulated c
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_players` pl ON c.hitterId = pl.playerId