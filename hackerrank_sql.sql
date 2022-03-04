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

/* Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN. */

SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE = 'JPN';

/* Query the difference between the maximum and the minimum populations in CITY. */

SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;

/* Write a query calculating the amount of error (actual - miscalculated average monthly salaries)
    and round it up to the next integer. */

SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary,'0', ''))) FROM EMPLOYEES

/* Write a query to print total number of unique hackers who made at least  submission each day 
(starting on the first day of the contest), and find the hacker_id and name of the hacker who made 
maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, 
print the lowest hacker_id. 
The query should print this information for each day of the contest, sorted by the date. */

SELECT SUBMISSION_DATE,
(SELECT COUNT(DISTINCT HACKER_ID)  
 FROM SUBMISSIONS S2  
 WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE AND    
(SELECT COUNT(DISTINCT S3.SUBMISSION_DATE) 
 FROM SUBMISSIONS S3 WHERE S3.HACKER_ID = S2.HACKER_ID AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE) = DATEDIFF(S1.SUBMISSION_DATE , '2016-03-01')),
(SELECT HACKER_ID FROM SUBMISSIONS S2 WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE 
GROUP BY HACKER_ID ORDER BY COUNT(SUBMISSION_ID) DESC, HACKER_ID LIMIT 1) AS TMP,
(SELECT NAME FROM HACKERS WHERE HACKER_ID = TMP)
FROM
(SELECT DISTINCT SUBMISSION_DATE FROM SUBMISSIONS) S1
GROUP BY SUBMISSION_DATE;

