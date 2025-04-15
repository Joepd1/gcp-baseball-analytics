CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.fact_games` AS
SELECT
    g.gameId,
    g.seasonId,
    g.venueId,
    g.homeTeamId,
    g.awayTeamId,
    g.gameNumber,
    st.seasonTypeId,
    dn.dayNightId,
    g.startTime,
    g.schedule_created AS created,
    gs.gameStatusId,
    g.durationMinutes,
    g.attendance,
    g.homeFinalRuns,
    g.homeFinalHits,
    g.homeFinalErrors,
    g.awayFinalRuns,
    g.awayFinalHits,
    g.awayFinalErrors
FROM
    `devoteam-tech-challenge-456311.baseball.stg_games` g
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_season_types` st ON g.seasonType = st.seasonType
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_day_nights` dn ON g.dayNight = dn.dayNight
    LEFT JOIN `devoteam-tech-challenge-456311.baseball.dim_game_statuses` gs ON g.schedule_status = gs.game_status;