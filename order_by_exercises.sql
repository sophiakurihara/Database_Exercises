SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M' 
AND (
	first_name IN ('Irena', 'Vidya') 
	OR first_name = 'Maya'
	)
ORDER BY first_name, last_name;
-- Finds all male employees with these first names
-- in ascending order by first name and last name

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%e';
-- employees whose last names begin and end with 'e'

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT * FROM employees
WHERE birth_date LIKE '%-12-25';

SELECT * FROM employees
WHERE last_name LIKE '%q%';
-- employees whose last names contain the letter 'q'

SELECT emp_no, first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
-- finds all employees hired in the 90's with birthdays on christmas

SELECT * FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
-- employees with 'q' in their last name but not 'qu'