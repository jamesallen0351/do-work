/* Self join SQL Zoo */

/* How many stops are in the database? */

SELECT COUNT(id) FROM stops

/* 2. Find the id value for the stop 'Craiglockhart' */

SELECT id FROM stops
WHERE name = 'Craiglockhart'

/* 3. Give the id and the name for the stops on the '4' 'LRT' service. */ 

SELECT DISTINCT id, stops.name FROM route
JOIN stops ON stop = stops.id
WHERE num = 4 AND company = 'LRT'

