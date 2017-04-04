USE codeup_test_db;
SELECT 'Deleting albums released after 1991' AS 'I'\G
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Deleting albums under disco genre' AS 'II'\G
DELETE FROM albums WHERE genre LIKE '%disco%' or genre LIKE '%Disco';

SELECT 'Deleting albums by Celine Dion' AS 'III'\G
DELETE FROM albums WHERE artist = 'Celine Dion';