SELECT * FROM ipl_data.deliveries;

SELECT * FROM ipl_data.matches;

-- SELECTING THE FIELDS
SELECT deliveries.match_id, matches.id, deliveries.inning, matches.date, matches.season, deliveries.batting_team, deliveries.bowling_team,
deliveries.over, deliveries.ball, deliveries.batsman, deliveries.non_striker,deliveries.bowler,deliveries.batsman_runs,deliveries.total_runs, 
 matches.team1,matches.team2, matches.result, matches.winner 
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
ORDER BY matches.season, matches.date, deliveries.inning , deliveries.over, deliveries.ball;

-- TOP SCORED TEAM IN 2008 SEASON
SELECT matches.season, deliveries.batting_team AS Team, SUM(deliveries.total_runs) AS `Total Runs`,  COUNT(DISTINCT(match_id)) AS Matches
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008
GROUP BY deliveries.batting_team
ORDER BY `Total Runs` DESC
LIMIT 10;


-- TOP SCORED BATSMAN IN 2008 SEASON
SELECT matches.season, deliveries.batsman AS team, deliveries.batting_team, COUNT(ball) AS BALLS, SUM(`batsman_runs`) AS `BATSMAN  RUNS`,  COUNT(DISTINCT(match_id)) AS Matches
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 AND deliveries.wide_runs = 0 AND deliveries.noball_runs = 0 AND deliveries.penalty_runs = 0
GROUP BY batsman
ORDER BY `BATSMAN  RUNS` DESC
LIMIT 10;

-- TOP SCORED TEAM IN ONE INNING IN 2008 SEASON
SELECT matches.season, deliveries.batting_team AS Team, SUM(deliveries.total_runs) AS `Total Runs`
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008
GROUP BY deliveries.match_id, deliveries.batting_team
ORDER BY `Total Runs` DESC
LIMIT 10;

-- TOP SCORER IN ONE INNINGS
SELECT matches.season, deliveries.batsman, COUNT(ball) AS Balls,COUNT(CASE WHEN batsman_runs = 4 THEN 1 END) AS 4S, 
COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS 6S, SUM(`batsman_runs`) AS `Runs`
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 AND deliveries.wide_runs = 0 AND deliveries.noball_runs = 0 AND deliveries.penalty_runs = 0
GROUP BY deliveries.match_id, deliveries.batsman
ORDER BY `Runs` DESC
LIMIT 10;

-- HIGHEST SIXES IN ONE SEASON 2008 BY TEAM
SELECT matches.season, deliveries.batting_team, COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS 6S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.batting_team
ORDER BY `6S` DESC
LIMIT 10;

-- HIGHEST SIXES IN ONE SEASON 2008 BY BATSMAN
SELECT matches.season, deliveries.batting_team, deliveries.batsman, COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS 6S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.batsman
ORDER BY `6S` DESC
LIMIT 10;

-- HIGHEST SIXES IN ONE INNINGS BY TEAM
SELECT matches.season, deliveries.batting_team, COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS 6S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.match_id, deliveries.batting_team
ORDER BY `6S` DESC
LIMIT 10;

-- HIGHEST SIXES IN ONE INNING BY BATSMAN
SELECT matches.season, deliveries.batting_team, deliveries.batsman, COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS 6S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.match_id, deliveries.batsman
ORDER BY `6S` DESC
LIMIT 10;

-- HIGHEST FOURS IN ONE SEASON 2008 BY TEAM
SELECT matches.season, deliveries.batting_team, COUNT(CASE WHEN batsman_runs = 4 THEN 1 END) AS 4S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.batting_team
ORDER BY `4S` DESC
LIMIT 10;

-- HIGHEST FOURS IN ONE SEASON 2008 BY BATSMAN
SELECT matches.season, deliveries.batting_team, deliveries.batsman, COUNT(CASE WHEN batsman_runs = 4 THEN 1 END) AS 4S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.batsman
ORDER BY `4S` DESC
LIMIT 10;

-- HIGHEST FOURS IN ONE INNINGS BY TEAM
SELECT matches.season, deliveries.batting_team, COUNT(CASE WHEN batsman_runs = 4 THEN 1 END) AS 4S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.match_id, deliveries.batting_team
ORDER BY `4S` DESC
LIMIT 10;

-- HIGHEST FOURS IN ONE INNING BY BATSMAN
SELECT matches.season, deliveries.batting_team, deliveries.batsman, COUNT(CASE WHEN batsman_runs = 4 THEN 1 END) AS 4S
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 
GROUP BY deliveries.match_id, deliveries.batsman
ORDER BY `4S` DESC
LIMIT 10;

-- TOP WICKET TAKER TEAM IN 2008 SEASON
SELECT matches.season, deliveries.bowling_team AS Team, COUNT(CASE WHEN player_dismissed !='' THEN 1 END) AS Wickets,  COUNT(DISTINCT(match_id)) AS Matches
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008
GROUP BY Team
ORDER BY `Wickets` DESC
LIMIT 10;

-- TOP WICKET TAKER IN 2008 SEASON
SELECT matches.season, deliveries.bowler, deliveries.bowling_team AS Team, COUNT(CASE WHEN player_dismissed !='' THEN 1 END) AS Wickets, COUNT(DISTINCT(match_id)) AS Matches
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 AND dismissal_kind != 'run out'
GROUP BY deliveries.bowler
ORDER BY `Wickets` DESC
LIMIT 10;

-- TOP WICKET TAKER IN ONE INNING IN 2008 SEASON
SELECT matches.season, deliveries.bowler, deliveries.bowling_team AS Team, COUNT(CASE WHEN player_dismissed !='' THEN 1 END) AS Wickets
FROM ipl_data.deliveries deliveries
JOIN ipl_data.matches matches
ON deliveries.match_id=matches.id 
WHERE season = 2008 AND dismissal_kind != 'run out'
GROUP BY deliveries.match_id, deliveries.bowler
ORDER BY `Wickets` DESC
LIMIT 10;
