CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.stg_teams` AS
SELECT DISTINCT
    homeTeamId AS teamId,
    homeTeamName AS teamName
FROM
    `devoteam-tech-challenge-456311.baseball.raw_schedules_filtered`