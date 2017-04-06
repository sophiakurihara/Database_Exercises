SELECT COUNT (*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
GROUP BY gender;
-- Finds all male employees with these first names
-- in ascending order by first name and last name

SELECT DISTINCT CONCAT(first_name, " ", last_name)
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY last_name, first_name;
-- now presented in a single column with first and last names
-- employees whose last names begin and end with 'e'

SELECT CONCAT(first_name,' ', last_name, 
			' has been working for ',
			DATEDIFF(NOW(), hire_date), ' days.') 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25'
ORDER BY last_name, first_name;
-- finds all employees hired in the 90's with birthdays on christmas

SELECT COUNT (*), first_name, last_name 
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name, first_name
ORDER BY COUNT(*) DESC, last_name, first_name;
-- employees with 'q' in their last name but not 'qu'