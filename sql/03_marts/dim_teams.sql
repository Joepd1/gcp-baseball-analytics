CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_teams` AS
SELECT
    teamId,
    teamName
FROM
    `devoteam-tech-challenge-456311.baseball.stg_teams`