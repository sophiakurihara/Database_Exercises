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