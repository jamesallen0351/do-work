/* Self join SQL Zoo */

/* How many stops are in the database? */

SELECT COUNT(id) FROM stops

/* 2. Find the id value for the stop 'Craiglockhart' */

SELECT id FROM stops
WHERE name = 'Craiglockhart'

