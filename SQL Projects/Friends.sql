use Karthik;

CREATE TABLE Friends (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    PhoneNumber VARCHAR(15)
);
INSERT INTO Friends (ID, FirstName, LastName, Country, Age, PhoneNumber) VALUES
(1, 'Karthik', 'Reddy', 'India', 23, '9182024443'),
(2, 'Akshith', 'Aarav', 'Australia', 21, '9573725999'),
(3, 'Shreya', 'Reddy', 'USA', 24, '7901017118'),
(4, 'Arjun', 'Reddy', 'Austria', 21, '9866096050'),
(5, 'Deeksha', 'Akula', 'Spain', 22, '6303648433');
SELECT * FROM Friends;

