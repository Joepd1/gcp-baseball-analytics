CREATE OR REPLACE TABLE
  `devoteam-tech-challenge-456311.baseball.test_batch_schedules` AS
WITH
  numbered_homegames AS (
    SELECT
      *,
      ROW_NUMBER() OVER (
        PARTITION BY
          homeTeamId
        ORDER BY
          startTime
      ) AS rn
    FROM
      `devoteam-tech-challenge-456311.baseball.raw_schedules_filtered`
    WHERE
      gameId IS NOT NULL
      AND gameId != ""
  )
SELECT
  *
FROM
  numbered_homegames
WHERE
  rn <= 10