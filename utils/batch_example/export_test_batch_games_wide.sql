EXPORT DATA OPTIONS(
    uri = 'gs://devoteam-tech-challenge-456311-batch-test-bucket/test_batch_games_wide-*.avro',
    format = 'AVRO',
    overwrite = true
) AS
SELECT
    *
FROM
    `devoteam-tech-challenge-456311.baseball.test_batch_games_wide`;