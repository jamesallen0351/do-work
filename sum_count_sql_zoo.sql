/* SQL Zoo SUM and COUNT Exercises */

/* World Country Profile: Aggregate functions
This tutorial is about aggregate functions such as COUNT, SUM and AVG. An aggregate function takes many values 
and delivers just one value. 
For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11. */

/* 1. Show the total population of the world. */

SELECT SUM(population)
FROM world;

/* 2. List all the continents - just once each. */

SELECT DISTINCT(continent) FROM world;