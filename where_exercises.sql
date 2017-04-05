SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M' 
AND (
	first_name IN ('Irena', 'Vidya') 
	OR first_name = 'Maya'
	);
-- Finds all male employees with these first names

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%e';

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT * FROM employees
WHERE birth_date LIKE '%-12-25';

SELECT * FROM employees
WHERE last_name LIKE '%q%';