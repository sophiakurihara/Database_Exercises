USE employees;

ALTER TABLE albums
ADD UNIQUE(artist);
-- for indexes exercise

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

-- created same setup for joins exercise

INSERT INTO roles (name) VALUES ('author');
-- created role called 'author'

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 1),
('sally', 'sally@example.com', 1),
('adam', 'adam@example.com', null);
-- 3 authors, and one null role

SELECT roles.name as role_name, count(roles.name) AS role_count
FROM roles
GROUP BY role_name;
-- returns the number of users with a specific role.

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';
-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND gender = 'F';
-- all the departments headed by women

SELECT title AS 'Title', count(de.emp_no) AS 'Count'
FROM titles AS t
JOIN dept_emp AS de
	ON t.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01' AND t.to_date = '9999-01-01' AND de.dept_no = 'd009'
GROUP BY title;
-- Find the current titles of employees currently working in the Customer Service department.

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', sa.salary AS 'Salary'
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN salaries AS sa
  ON sa.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND sa.to_date = '9999-01-01';
-- current managers' salaries

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(m.first_name, ' ', m.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no

JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no
JOIN employees AS m
	ON m.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';
-- Bonus: Find the names of all current employees, their department name, and their current manager's name.

SELECT gender AS 'Gender', AVG(s.salary) AS 'Historic Avg. Salary'
FROM employees AS e
JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = dm.emp_no
GROUP BY gender;
-- Historic average salary of F managers vs M managers

SELECT gender AS 'Gender', AVG(s.salary) AS 'Historic Avg. Salary'
FROM employees AS e
JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
JOIN salaries AS s
	ON s.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01'AND s.to_date = '9999-01-01'
GROUP BY gender;
-- current avg salary of F managers vs M managers

SELECT gender AS 'Gender', AVG(s.salary) AS 'Historic Avg. Salary'
FROM employees AS e
JOIN salaries AS s
	ON s.emp_no = e.emp_no
GROUP BY gender;
-- Historic avg salary of F workers vs M workers

SELECT gender AS 'Gender', AVG(s.salary) AS 'Historic Avg. Salary'
FROM employees AS e
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY gender;
-- Current avg salary of F workers vs M workers

SELECT gender AS 'Gender', count(dm.emp_no) 
FROM employees AS e
JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
GROUP BY gender;
-- current count of F managers vs. male managers

SELECT gender AS 'Gender', count(t.title) AS 'Current # of Engineers'
FROM employees AS e
JOIN titles AS t
	ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' AND t.title = 'Engineer'
GROUP BY gender;
-- current count of F engineers vs M engineers w/ 'Engineer' title


