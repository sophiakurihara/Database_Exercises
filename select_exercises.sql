USE codeup_test_db;

SELECT name FROM albums WHERE artist = 'Pink Floyd'\G
SELECT release_date FROM albums WHERE name = 'Sgt. Peppers Lonely Hearts Club Band';
SELECT genre FROM albums WHERE name = 'Nevermind'\G
SELECT name FROM albums WHERE release_date >= 1990\G
-- Could also use BETWEEN 'year' AND 'year'
SELECT name FROM albums WHERE sales < 20000000\G
SELECT name FROM albums WHERE genre LIKE '%rock%' OR genre LIKE '%Rock'\G