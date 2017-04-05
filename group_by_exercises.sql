SELECT title
FROM titles
GROUP BY title;
-- finds distinct titles

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name;
-- finds distinct last names that start and end with 'e'

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY first_name, last_name;
-- groups ^^ with distinct first and last names

SELECT last_name FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- groups by distinct last names containing 'q' but not 'qu'