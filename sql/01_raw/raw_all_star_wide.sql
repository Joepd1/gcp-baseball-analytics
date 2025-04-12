CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.raw_all_star_wide` AS
SELECT
    *
FROM
    `devoteam-tech-challenge-456311.baseball.raw_games_wide`
WHERE
    homeTeamId IN (
        'dd59d49e-caee-4443-9220-f05d0d9bd1e1',
        '3bbb3b39-b5cb-4fc9-bd22-522521f0f329'
    )