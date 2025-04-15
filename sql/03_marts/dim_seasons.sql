CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_seasons` AS
SELECT DISTINCT
    seasonId,
    year
FROM
    `devoteam-tech-challenge-456311.baseball.stg_seasons`