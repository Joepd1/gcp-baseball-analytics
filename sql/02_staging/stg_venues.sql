CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.stg_venues` AS
SELECT
    venueId,
    venueName,
    venueSurface,
    venueCapacity,
    venueCity,
    venueState,
    venueZip,
    venueMarket,
    venueOutfieldDistances
FROM
    `devoteam-tech-challenge-456311.baseball.raw_games_wide_filtered`
UNION DISTINCT
SELECT
    venueId,
    venueName,
    venueSurface,
    venueCapacity,
    venueCity,
    venueState,
    venueZip,
    venueMarket,
    venueOutfieldDistances
FROM
    `devoteam-tech-challenge-456311.baseball.raw_games_post_wide`