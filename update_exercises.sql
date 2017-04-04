USE codeup_test_db;
-- Displaying all album names and sales
SELECT 'Here are All albums:' AS 'I'\G
SELECT name, sales FROM albums;
-- Setting sales values to *10 the original
UPDATE albums SET sales = (sales * 10);
SELECT 'Here are updated sales' AS 'I.A.'\G
-- Displaying updated sales values
SELECT sales FROM albums;

-- Displaying albumes released before 1980
SELECT 'Released BEFORE 1980:' AS 'II'\G
SELECT name FROM albums WHERE release_date < '1980-01-01';
-- Setting albums before 1980 back to 1800s
UPDATE albums SET release_date = DATE_SUB(release_date, INTERVAL 100 YEAR) WHERE release_date < '1980-01-01';
SELECT 'Here are albums moved back to 1800s:' AS 'II.A.'\G
SELECT name FROM albums WHERE release_date < '1980-01-01';

-- Displaying albums by MJ
SELECT 'Albums by MJ:' AS 'III'\G
SELECT name FROM albums WHERE artist = 'Michael Jackson';
-- Setting Michael Jackson to Peter Jackson
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
SELECT 'Albums by Peter Jackson:' AS 'III.A.'\G
SELECT name FROM albums WHERE artist = 'Peter Jackson';



