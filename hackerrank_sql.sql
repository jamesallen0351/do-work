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

/* Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 ≤ Y1. */

SELECT f1.X, f1.Y FROM Functions AS f1 
WHERE f1.X = f1.Y AND
(SELECT COUNT(*) FROM Functions WHERE X = f1.X AND Y = f1.Y) > 1
UNION
SELECT f1.X, f1.Y from Functions AS f1
WHERE EXISTS(SELECT X, Y FROM Functions WHERE f1.X = Y AND f1.Y = X AND f1.X < X)
ORDER BY X;

/* Query the following two values from the STATION table:
    1. The sum of all values in LAT_N rounded to a scale of  decimal places.
    2. The sum of all values in LONG_W rounded to a scale of  decimal places. */

SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_W), 2) AS lon FROM STATION;

/* Query the sum of Northern Latitudes (LAT_N) from STATION having values 
    greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places. */

SELECT TRUNCATE(SUM(LAT_N), 4) FROM STATION WHERE LAT_N BETWEEN 38.7880 AND 137.2345;
