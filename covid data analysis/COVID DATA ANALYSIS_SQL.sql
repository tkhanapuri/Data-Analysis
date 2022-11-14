-- SELECTING THE FIELDS
SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest

-- CHECKING FOR ANY NULL 
SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `Country/Region` IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE Confirmed IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE Deaths IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE Recovered IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, `Active`, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `Active` IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, `Active`, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `New cases` IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, `Active`, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `New deaths` IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, `Active`, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `New recovered` IS NULL

SELECT `Country/Region`, Confirmed, Deaths, Recovered, `Active`, `New cases`, `New deaths`, `New recovered`, `WHO Region` 
FROM new_schema.country_wise_latest
WHERE `WHO Region` IS NULL

-- LOOKING AT PERCENTAGE OF DEATHS
SELECT CONCAT(CAST(SUM(Deaths)/SUM(Confirmed)*100 as DECIMAL (5,2)),'%') AS `Percentage of Deaths`
FROM new_schema.country_wise_latest

-- LOOKING AT PERCENTAGE OF RECOVERED
SELECT CONCAT(CAST(SUM(Recovered)/SUM(Confirmed)*100 as DECIMAL (5,2)),'%') AS `Percentage of Recovered`
FROM new_schema.country_wise_latest

-- LOOKING AT PERCENTAGE OF ACTIVE
SELECT CONCAT(CAST(SUM(Active)/SUM(Confirmed)*100 as DECIMAL (5,2)),'%') AS `Percentage of Active`
FROM new_schema.country_wise_latest

-- LOOKING THE CONTRIES WITH HIGHEST CONFIRMED 
SELECT `Country/Region`, Confirmed
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`
ORDER BY Confirmed DESC

 -- LOOKING THE CONTRIES WITH HIGHEST DEATHS 
SELECT `Country/Region`, Deaths
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`
ORDER BY Deaths DESC

-- LOOKING THE CONTRIES WITH HIGHEST RECOVERED 
SELECT `Country/Region`, Recovered
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`
ORDER BY Recovered DESC

-- LOOKING THE CONTRIES WITH HIGHEST ACTIVE 
SELECT `Country/Region`, Active
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`
ORDER BY `Active` DESC

-- LOOKING THE PERCENTAGE OF DEATHS, RECOVERED AND ACTIVE CASES PER COUNTRY
SELECT `Country/Region`, CONCAT(SUM(Deaths)/SUM(Confirmed)*100,'%') AS `Percentage of Deaths`,
CONCAT(SUM(Recovered)/SUM(Confirmed)*100 ,'%') AS `Percentage of Recovered`,
CONCAT(SUM(Active)/SUM(Confirmed)*100 ,'%') AS `Percentage of Active`
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`

SELECT `Country/Region`, Confirmed, Deaths, Recovered, Active, `New cases`, `New deaths`, `New recovered`
FROM new_schema.country_wise_latest
GROUP BY `Country/Region`
ORDER BY `Confirmed` DESC

-- joining the two tables
SELECT LATEST.`Country/Region`,LATEST.Confirmed, LATEST.Deaths, LATEST.Recovered, LATEST.Active,
COMPLETE.`Country/Region`, COMPLETE.Date, COMPLETE.Confirmed, COMPLETE.Deaths, COMPLETE.Recovered, COMPLETE.Active
FROM new_schema.country_wise_latest LATEST
JOIN new_schema.covid_19_clean_complete COMPLETE
ON LATEST.`Country/Region`= COMPLETE.`Country/Region`
ORDER BY COMPLETE.`Date`

