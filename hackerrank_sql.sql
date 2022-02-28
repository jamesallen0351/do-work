/* HackerRank SQL Exercises */

/* 1. Query all columns for all American cities in the CITY table with populations larger than 100000.
    The CountryCode for America is USA. */

SELECT * FROM CITY
WHERE COUNTRYCODE = 'USA'
AND POPULATION > 100000;

/* Query the total population of all cities in CITY where the District is California */

SELECT SUM(POPULATION) FROM CITY
WHERE DISTRICT = 'California';

/* Query the average population of all cities in CITY where District is California */

SELECT AVG(POPULATION) FROM CITY
WHERE DISTRICT = 'California';

/* Query the average population for all cities in CITY, rounded down to the nearest integer. */

SELECT ROUND(AVG(POPULATION)) FROM CITY;