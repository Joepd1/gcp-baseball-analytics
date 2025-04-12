WITH
    referenced_players AS (
        SELECT
            rob0_start AS playerId
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            rob1_start
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            rob2_start
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            rob3_start
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder1
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder2
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder3
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder4
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder5
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder6
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder7
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder8
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder9
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder10
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder11
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayFielder12
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter1
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter2
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter3
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter4
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter5
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter6
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter7
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter8
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            awayBatter9
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder1
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder2
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder3
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder4
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder5
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder6
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder7
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder8
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder9
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder10
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder11
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeFielder12
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter1
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter2
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter3
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter4
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter5
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter6
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter7
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter8
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            homeBatter9
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        UNION DISTINCT
        SELECT
            lineupPlayerId
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_postfiltered`
    ),
    known_players AS (
        SELECT DISTINCT
            hitterId AS playerId,
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        WHERE
            hitterId IS NOT NULL
        UNION DISTINCT
        SELECT DISTINCT
            pitcherId
        FROM
            `devoteam-tech-challenge-456311.baseball.raw_games_wide_post`
        WHERE
            pitcherId IS NOT NULL
    )
SELECT
    playerId
FROM
    referenced_players
EXCEPT DISTINCT
SELECT
    playerId
FROM
    known_players;