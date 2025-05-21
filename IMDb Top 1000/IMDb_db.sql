CREATE DATABASE imdb_db;
USE imdb_db;

CREATE TABLE IMDb_Top_1000 (
    Title VARCHAR(255),
    Released_Year INT,
    Certificate VARCHAR(10),
    Runtime VARCHAR(20),
    Genre VARCHAR(255),
    IMDB_Rating FLOAT,
    Overview TEXT,
    Rotten_Tomatoes_Percentage FLOAT,
    Director VARCHAR(255),
    No_of_Votes INT,
    Gross FLOAT,
    Cast TEXT
);


SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE '"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\IMDb_Top_1000.csv"'
INTO TABLE IMDb_Top_1000
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM IMDb_Top_1000 LIMIT 10;


-- Basic Queries
SELECT * FROM IMDb_Top_1000;
SELECT Title, IMDB_Rating FROM IMDb_Top_1000 WHERE IMDB_Rating > 8.5;
SELECT DISTINCT Genre FROM IMDb_Top_1000;

-- Filtering Data
SELECT * FROM IMDb_Top_1000 WHERE Released_Year BETWEEN 2000 AND 2020;
SELECT * FROM IMDb_Top_1000 WHERE Certificate = 'A';

-- Sorting Data
SELECT * FROM IMDb_Top_1000 ORDER BY IMDB_Rating DESC;
SELECT * FROM IMDb_Top_1000 ORDER BY No_of_Votes DESC LIMIT 10;

-- Aggregate Functions
SELECT COUNT(*) FROM IMDb_Top_1000;
SELECT AVG(IMDB_Rating) AS Avg_Rating FROM IMDb_Top_1000;
SELECT MIN(Gross) AS Min_Gross, MAX(Gross) AS Max_Gross FROM IMDb_Top_1000;

-- Group By & Having
SELECT Genre, COUNT(*) FROM IMDb_Top_1000 GROUP BY Genre;
SELECT Director, AVG(IMDB_Rating) FROM IMDb_Top_1000 GROUP BY Director HAVING AVG(IMDB_Rating) > 8;

-- Joins (Example with hypothetical Awards table)
SELECT m.Title, a.Award_Name FROM IMDb_Top_1000 m
JOIN Awards a ON m.Title = a.Movie_Title;

-- Subqueries
SELECT Title, IMDB_Rating FROM IMDb_Top_1000 
WHERE IMDB_Rating > (SELECT AVG(IMDB_Rating) FROM IMDb_Top_1000);


-- Views
CREATE VIEW Top_Rated AS SELECT * FROM IMDb_Top_1000 WHERE IMDB_Rating > 8.5;

-- Indexing (Performance Optimization)
CREATE INDEX idx_rating ON IMDb_Top_1000(IMDB_Rating);

-- Stored Procedure (Example to get top N movies)
DELIMITER //
CREATE PROCEDURE GetTopMovies(IN limit_count INT)
BEGIN
    SELECT * FROM IMDb_Top_1000 ORDER BY IMDB_Rating DESC LIMIT limit_count;
END //
DELIMITER ;

-- Triggers (Example to log deleted records)
CREATE TABLE Deleted_Movies (Title VARCHAR(255), Deleted_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TRIGGER log_movie_deletion
BEFORE DELETE ON IMDb_Top_1000
FOR EACH ROW
INSERT INTO Deleted_Movies (Title) VALUES (OLD.Title);

-- Transactions
START TRANSACTION;
UPDATE IMDb_Top_1000 SET IMDB_Rating = 9.5 WHERE Title = 'The Shawshank Redemption';
ROLLBACK; -- Undo the update


