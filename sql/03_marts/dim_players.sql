CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_players` AS
SELECT
    playerId,
    firstName,
    lastName,
    weight,
    height,
    batHand,
    throwHand
FROM
    `devoteam-tech-challenge-456311.baseball.stg_players`
ORDER BY
    lastName ASC,
    firstName ASC,
    weight ASC