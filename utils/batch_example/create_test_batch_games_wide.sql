CREATE OR REPLACE TABLE
  `devoteam-tech-challenge-456311.baseball.test_batch_games_wide` AS
SELECT
  g.*,
FROM
  `devoteam-tech-challenge-456311.baseball.raw_games_wide_filtered` g
  JOIN `devoteam-tech-challenge-456311.baseball.test_batch_schedules` s ON g.gameId = s.gameId