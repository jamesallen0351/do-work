/* SQL Zoo Using Null Exercises */

/* 1. List the teachers who have NULL for their department. */

SELECT teacher.name FROM teacher 
WHERE dept IS NULL

