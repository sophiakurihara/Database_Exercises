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

SELECT departments.dept_name AS 'Department Name'
FROM departments;