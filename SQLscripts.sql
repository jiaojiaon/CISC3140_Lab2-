
--Part 1
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS Car_Score;
DROP TABLE IF EXISTS Cars;

.headers on
.mode csv

CREATE TABLE judges(
    Timestamp datetime,
    Judge_ID text,
    Judge_Name text);
.import \judgesTable.csv judges
DELETE FROM judges WHERE Judge_ID = 'Judge_ID';

CREATE TABLE Car_Score
    Car_ID int primary key,
    Car_Score int);
 .import \Car_Score.csv Car_Score
DELETE FROM Car_Score WHERE Car_ID = 'Car_ID';

CREATE TABLE Cars(
    Car_ID int primary key,
    Car_Year int,
    Car_Make text,
    Car_Model text,
    Owner_Name text,
    Owner_Email text);
.import \carsTable.csv Cars
DELETE FROM Cars WHERE Car_ID = 'Car_ID';

--Part 2
DROP TABLE IF EXISTS Car_Total;
DROP TABLE IF EXISTS Car_Rank;
DROP TABLE IF EXISTS Rank;

CREATE TABLE Car_Total(
    Car_ID int,
    Car_Year int,
    Car_Make text,
    Car_Model text,
    Car_Total int);

INSERT INTO Car_Total SELECT Cars.Car_ID, Cars.Car_Year, Cars.Car_Make,Cars.Car_Model, Car_Score.Car_Score FROM Cars, Car_Score WHERE Cars.Car_ID = Car_Score.Car_ID;

CREATE TABLE Car_Rank(
    Car_ID int,
    Car_Year int,
    Car_Make text,
    Car_Model text,
    Car_Total int,
    Car_Rank int);

INSERT INTO Car_Rank(Car_ID,Car_Year,Car_Make, Car_Model,Car_Total) SELECT Car_ID,Car_Year,Car_Make,Car_Model,Car_Total FROM Car_Total ORDER BY Car_Total DESC;

CREATE TABLE Rank(
    Car_Rank int,
    Car_ID int,
    Car_Year int,
    Car_Make text,
    Car_Model text);

INSERT INTO Rank(Ranking, Car_ID,Year,Car_Make,Car_Model) SELECT rowid, Car_ID,Car_Year,Car_Make,Car_Model FROM Car_Rank;

.header on
.mode csv
.output extract1.csv
SELECT * FROM Rank;

--Part 2.2

DROP TABLE IF EXISTS RankWithTotal;
DROP TABLE IF EXISTS RankTopOne;
DROP TABLE IF EXISTS RankTopTwo;
DROP TABLE IF EXISTS RankTopThree;
DROP TABLE IF EXISTS TopThree_Car;

 CREATE TABLE RankWithTotal(
    Rank int,
    Car_Make text,
    Car_ID int,
    Total_Score int);

INSERT INTO RankWithTotal(Rank, Car_Make,Car_ID,Total_Score) SELECT Rank.Ranking,Rank.Car_Make,Rank.Car_ID,Car_Rank.Car_Total FROM Rank,Car_Rank WHERE Rank.Car_ID = Car_Rank.Car_ID;

CREATE TABLE RankTopOne(
    Rank int,
    Car_Make text,
    Car_ID int,
    Total_Score int);

INSERT INTO RankTopOne(Rank, Car_Make,Car_ID,Total_Score)SELECT Rank, Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make;

DELETE FROM RankWithTotal WHERE EXISTS (SELECT * FROM RankTopOne WHERE RankTopOne.Rank == RankWithTotal.Rank);

CREATE TABLE RankTopTwo(
    Rank int,
    Car_Make text,
    Car_ID int,
    Total_Score int);

INSERT INTO RankTopTwo(Rank, Car_Make,Car_ID,Total_Score)SELECT MIN(Rank), Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make ORDER BY Rank;
 
DELETE FROM RankWithTotal WHERE EXISTS (SELECT * FROM RankTopTwo WHERE RankTopTwo.Rank == RankWithTotal.Rank);

CREATE TABLE RankTopThree(
    Rank int,
    Car_Make text,
    Car_ID int,
    Total_Score int);

INSERT INTO RankTopThree(Rank, Car_Make,Car_ID,Total_Score)SELECT MIN(Rank), Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make ORDER BY Rank;


CREATE TABLE TopThree_Car(
    Rank int,
    Car_Make text,
    Car_ID int,
    Total_Score int);

INSERT INTO TopThree_Car(Rank, Car_Make,Car_ID,Total_Score) SELECT * FROM RankTopOne UNION SELECT * FROM RankTopTwo UNION SELECT * FROM RankTopThree ORDER BY Car_Make, rank;

.header on
.mode csv
.output extract2.csv
SELECT * FROM TopThree_Car;

--Part 3

DROP TABLE IF EXISTS newJudges_Table;

UPDATE judges_Table SET Timestamp = SUBSTR(Timestamp, 5, 4) || "-0" || SUBSTR(Timestamp, 1,1) || "-0" || SUBSTR(Timestamp, 3, 1) || " " || SUBSTR(Timestamp, 10, 2) || ":" || SUBSTR(Timestamp, 13, 2)

CREATE TABLE newJudges_Table(
    Judge_ID text,
    Judge_Name text,
    NumberOfCar int,
    Start_Time datetime,
    End_Time datetime,
    Duration int,
    Average_speed int);

INSERT INTO newJudges_Table(Judge_ID, Judge_Name, NumberOfCar,Start_Time,End_Time,Duration,Average_speed) SELECT Judge_ID, Judge_Name, COUNT(Timestamp), MIN(Timestamp), MAX(Timestamp), CAST((JULIANDAY(MAX(Timestamp)) - JULIANDAY(MIN(Timestamp)))*24 AS INT) ,CAST(((JULIANDAY(MAX(Timestamp)) - JULIANDAY(MIN(Timestamp)))*24*60) AS INT) / COUNT(Timestamp) FROM judges_Table GROUP BY Judge_ID;

.header on
.mode csv
.output extract3.csv
SELECT * FROM newJudges_Table;
