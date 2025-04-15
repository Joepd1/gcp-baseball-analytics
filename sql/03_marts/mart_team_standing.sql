CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.mart_team_standing` AS
WITH
    team_results as (
        SELECT
            gameId,
            seasonTypeId,
            "HOME" as homeAway,
            homeTeamId as teamId,
            homeFinalRuns as runsScored,
            awayFinalRuns as runsAllowed,
            CASE
                WHEN homeFinalRuns > awayFinalRuns THEN 1
                ELSE 0
            END AS wins,
            CASE
                WHEN homeFinalRuns < awayFinalRuns THEN 1
                ELSE 0
            END AS losses
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_games`
        UNION ALL
        SELECT
            gameId,
            seasonTypeId,
            "AWAY" as homeAway,
            awayTeamId as teamId,
            awayFinalRuns as runsScored,
            homeFinalRuns as runsAllowed,
            CASE
                WHEN awayFinalRuns > homeFinalRuns THEN 1
                ELSE 0
            END AS wins,
            CASE
                WHEN awayFinalRuns < homeFinalRuns THEN 1
                ELSE 0
            END AS losses
        FROM
            `devoteam-tech-challenge-456311.baseball.fact_games`
    )
SELECT
    t.teamName,
    st.seasonType,
    ts.homeAway,
    COUNT(*) as gamesPlayed,
    SUM(ts.wins) as wins,
    SUM(ts.losses) as losses,
    ROUND(SAFE_DIVIDE(SUM(ts.wins), COUNT(*)), 3) AS pct,
    SUM(ts.runsScored) AS runsScored,
    SUM(ts.runsAllowed) AS runsAllowed,
    SUM(ts.runsScored) - SUM(ts.runsAllowed) AS runDiff
FROM
    team_results ts
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_season_types` st ON ts.seasonTypeId = st.seasonTypeId
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_teams` t ON ts.teamId = t.teamId
GROUP BY
    t.teamName,
    st.seasonType,
    ts.homeAway
ORDER BY
    st.seasonType DESC,
    wins DESC