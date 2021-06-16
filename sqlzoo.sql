--Complete sections 0-3 on SQL Zoo and paste a copy of each query in the practice.sql file
--Also do section 6 - JOINS (and paste the answers in practice.sql

 
-- SECTION 0 - SELECT BASICS

--Modify it to show the population of Germany
 
SELECT population FROM world
  WHERE name = 'Germany'
 
  
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
 
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

 
-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
 
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
 
 
-- SECTION 1 - SELECT NAME
 
--Find the country that start with Y
 
SELECT name FROM world
  WHERE name LIKE 'Y%'
 
 
-- Find the countries that end with y
 
SELECT name FROM world
  WHERE name LIKE '%y'
 
 
-- Find the countries that contain the letter x
 
SELECT name FROM world
  WHERE name LIKE '%x%'
 
 
-- Find the countries that end with land

SELECT name FROM world
  WHERE name LIKE '%land'
 
 
-- Find the countries that start with C and end with ia
 
SELECT name FROM world
  WHERE name LIKE 'C%ia'
 
 
-- Find the country that has oo in the name
 
SELECT name FROM world
  WHERE name LIKE '%oo%'
 
 
-- Find the countries that have three or more a in the name

SELECT name FROM world
 WHERE name LIKE '%a%a%a%'
 
 
-- Find the countries that have "t" as the second character.
 
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
 

 
 
-- Find the countries that have two "o" characters separated by two others.
 
SELECT name FROM world
 WHERE name LIKE '%o__o%'
  
 
-- Find the countries that have exactly four characters.
 
SELECT name FROM world
 WHERE name LIKE '____'
  
 
-- SECTION 2 - SELECT from World

-- Observe the result of running this SQL command to show the name, continent and population of all countries.
 
SELECT name, continent, population FROM world
 
 
-- Show the name for the countries that have a population of at least 200 million.
 
-- 200 million is 200000000, there are eight zeros.
 
SELECT name
  FROM world
 WHERE population > 200000000
 
 
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
 
select name, gdp/population 
from world 
where population >= 200000000

 
-- Show the name and population in millions for the countries of the continent 'South America'.
 
select name, population/1000000 
from world 
where continent like '%South America%'
 
 
-- Show the name and population for France, Germany, Italy
 
select name, population
 from world 
where name in ('France', 'Germany', 'Italy')

 
-- Show the countries which have a name that includes the word 'United'
 
select name
 from world 
where name like '%United%'
 
 
-- Show the countries that are big by area or big by population. Show name, population and area.
 
select name, population, area 
from world
where area > 3000000 or population > 250000000
 
 
-- Show the countries that are big by area or big by population but not both. Show name, population and area.

select name, population, area
from world
where area > 3000000 xor population > 250000000
 
 
-- For South America show population in millions and GDP in billions both to 2 decimal places.
 
select name, round(population/1000000, 2), round(gdp/1000000000, 2) 
from world
where continent = 'South America'

 
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
 
select name, round(gdp/population, -3)
from world
where gdp >= 1000000000000
 
 
-- Show the name and capital where the name and the capital have the same number of characters.
 
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
 
 
-- Show the name and the capital where the first letters of each match.
 
-- Don't include countries where the name and the capital are the same word.
 
SELECT name, capital
FROM world
where left(name,1)=left(capital,1) and name <> capital
 
 
-- Find the country that has all the vowels and no spaces in its name.
 
SELECT name
   FROM world
WHERE name like '%a%' and name like '%e%' and name like '%i%' and name like '%o%' and name like '%u%'
  AND name NOT LIKE '% %'
 
 
--SECTION 3 - SELECT FROM nobel
 

 
 
-- Change the query shown so that it displays Nobel prizes for 1950.
 
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 
-- Show who won the 1962 prize for Literature.
 
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
 
 
-- Show the year and subject that won 'Albert Einstein' his prize.
 
select yr, subject
from nobel
where winner = 'Albert Einstein'
 
 
-- Give the name of the 'Peace' winners since the year 2000, including 2000.
 
select winner 
from nobel
where yr >= 2000 and subject = 'Peace'
 
 
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
 
select yr, subject, winner
from nobel
where subject = 'Literature'
and yr >=1980 and yr <=1989
 
 
/*Show all details of the presidential winners:
 
Theodore Roosevelt
 
Woodrow Wilson
 
Jimmy Carter
 
Barack Obama*/
 
6.
 
SELECT * 
FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson','Jimmy Carter','Barack Obama')
 
 
-- Show the winners with first name John
 
7.
 
select winner
from nobel
where winner like 'John%'
 
 
-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
 
8.
 
select yr, subject, winner
from nobel
where subject = 'Physics' and yr = 1980 or subject = 'Chemistry' and yr=1984
 
 
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
 
9.
 
select yr, subject, winner
from nobel
where yr = 1980 and subject not in ('Chemistry', 'Medicine')
 
 
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year
 
-- (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year
 
-- (after 2004, including 2004)
 
select yr, subject, winner
from nobel
where subject = 'Medicine' and yr < 1910 or subject = 'Literature' and yr > 2003
