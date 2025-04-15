CREATE OR REPLACE TABLE
    `devoteam-tech-challenge-456311.baseball.dim_venues` AS
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
    `devoteam-tech-challenge-456311.baseball.stg_venues`