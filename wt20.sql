SELECT * FROM [World Cup]..WWC;

SELECT COUNT(*) FROM [World Cup]..wwc;

SELECT TEAM_1, COUNT(TEAM_1) AS HOME_COUNT FROM [World Cup]..wwc GROUP BY Team_1;

SELECT TEAM_2, COUNT(TEAM_2) AS HOME_COUNT FROM [World Cup]..wwc GROUP BY Team_2;

SELECT [             Venue], COUNT([             Venue]) FROM [World Cup]..wwc GROUP BY [             Venue];


--UPDATE [World Cup]
--SET  [             Venue] = TRIM([             Venue])AS VENUE FROM [World Cup]..wwc;

ALTER TABLE [World Cup]..wwC
ADD VENUE NVARCHAR(255);

UPDATE wwc
SET [             Venue] = TRIM([             Venue]);

--i'M AN IDIOT

ALTER TABLE [World Cup]..wwC
DROP COLUMN VENUE;

--ALTER TABLE [World Cup]..wwC
--RENAME COLUMN [             Venue] TO Venue;

EXEC sp_rename '[DBO].[WWC].[             Venue]','Venue','COLUMN'; -- SQL SERVER QUERY TO CHANGE COLUMN NAME

SELECT VENUE, COUNT([Venue]) NUM_OF_MATCHES_ON_GROUND FROM wwc GROUP BY VENUE ORDER BY NUM_OF_MATCHES_ON_GROUND DESC;

-- Newlands hosted maximum number of matches while boland 6 and st george 5

SELECT * FROM [World Cup]..WWC;

SELECT MATCH_ID, ((First_innings_score) - (Second_innings_score)) AS DIFFERENCE_IN_SCORE  FROM wwc;

SELECT First_innings_score, Second_innings_score ,CASE WHEN First_innings_score > Second_innings_score THEN 'TEAM 1 WON BY RUNS'
			WHEN First_innings_score < Second_innings_score THEN 'TEAM 2 WON BY WICKETS'
			ELSE 'TIE AND SUPEROVER'
			END RESULT_EXPLAINED
FROM wwc

SELECT TEAM_1, TEAM_2, First_innings_score, Second_innings_score ,CASE WHEN First_innings_score > Second_innings_score THEN Upper(TEAM_1) + ' won by ' + CONVERT(NVARCHAR, (First_innings_score - Second_innings_score)) +' runs.'
			WHEN First_innings_score < Second_innings_score THEN upper(TEAM_2) + ' won by ' + CONVERT(nvarchar, (10 - Second_innings_wkts))+' wickets.'
			ELSE 'TIE AND SUPEROVER'
			END RESULT_EXPLAINED
FROM wwc;

select Toss_winner, count(Toss_winner) as 'count_toss_won' from wwc group by Toss_winner order by count_toss_won desc offset 0 rows fetch first 1 row only;

with cte as (
select Toss_winner, count(Toss_winner) as 'count_toss_won' from wwc group by Toss_winner
)
select toss_winner, count_toss_won from cte where count_toss_won = (select max(count_toss_won) from cte)

select winner, count(winner) from wwc where stage = 'Group' group by winner; 

-- Australia won most matches in group stage.

select * from wwc;

select Player_of_the_match, count(Player_of_the_match) as 'PoMs'  from wwc group by Player_of_the_match order by PoMs desc;

--English player nat was the person who won most PoMs throughout the tournament.

