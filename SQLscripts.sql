CREATE TABLE judges(
   ...> Judge_ID text,
   ...> Judge_Name text);
.import \judgesTable.csv judges;

CREATE TABLE Car_Score
   ...> Car_ID int primary key,
   ...> Car_Score int);
 .import \Car_Score.csv Car_Score;

CREATE TABLE Cars(
   ...> Car_ID int primary key,
   ...> Car_Year int,
   ...> Car_Make text,
   ...> Car_Model text,
   ...> Owner_Name text,
   ...> Owner_Email text);
.import \carsTable.csv Cars

CREATE TABLE Car_Total(
   ...> Car_ID int,
   ...> Car_Year int,
   ...> Car_Make text,
   ...> Car_Model text,
   ...> Car_Total int);

INSERT INTO Car_Total SELECT Cars.Car_ID, Cars.Car_Year, Cars.Car_Make,Cars.Car_Model, Car_Score.Car_Score FROM Cars, Car_Score WHERE Cars.Car_ID = Car_Score.Car_ID;

CREATE TABLE Car_Rank(
   ...> Car_ID int,
   ...> Car_Year int,
   ...> Car_Make text,
   ...> Car_Model text,
   ...> Car_Total int,
   ...> Car_Rank int);

INSERT INTO Car_Rank(Car_ID,Car_Year,Car_Make, Car_Model,Car_Total) SELECT Car_ID,Car_Year,Car_Make,Car_Model,Car_Total FROM Car_Total ORDER BY Car_Total DESC;

CREATE TABLE Rank(
   ...> Car_Rank int,
   ...> Car_ID int,
   ...> Car_Year int,
   ...> Car_Make text,
   ...> Car_Model text);

INSERT INTO Rank(Ranking, Car_ID,Year,Car_Make,Car_Model) SELECT rowid, Car_ID,Car_Year,Car_Make,Car_Model FROM Car_Rank;

.mode csv
.output extract1.csv
SELECT * FROM Rank;


 CREATE TABLE RankWithTotal(
   ...> Rank int,
   ...> Car_Make text,
   ...> Car_ID int,
   ...> Total_Score int);

INSERT INTO RankWithTotal(Rank, Car_Make,Car_ID,Total_Score) SELECT Rank.Ranking,Rank.Car_Make,Rank.Car_ID,Car_Rank.Car_Total FROM Rank,Car_Rank WHERE Rank.Car_ID = Car_Rank.Car_ID;

CREATE TABLE RankTopOne(
   ...> Rank int,
   ...> Car_Make text,
   ...> Car_ID int,
   ...> Total_Score int);

INSERT INTO RankTopOne(Rank, Car_Make,Car_ID,Total_Score)SELECT Rank, Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make;

DELETE FROM RankWithTotal WHERE EXISTS (SELECT * FROM RankTopOne WHERE RankTopOne.Rank == RankWithTotal.Rank);

CREATE TABLE RankTopTwo(
   ...> Rank int,
   ...> Car_Make text,
   ...> Car_ID int,
   ...> Total_Score int);

INSERT INTO RankTopTwo(Rank, Car_Make,Car_ID,Total_Score)SELECT MIN(Rank), Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make ORDER BY Rank;
 
DELETE FROM RankWithTotal WHERE EXISTS (SELECT * FROM RankTopTwo WHERE RankTopTwo.Rank == RankWithTotal.Rank);

CREATE TABLE RankTopThree(
   ...> Rank int,
   ...> Car_Make text,
   ...> Car_ID int,
   ...> Total_Score int);

INSERT INTO RankTopThree(Rank, Car_Make,Car_ID,Total_Score)SELECT MIN(Rank), Car_Make,Car_ID,Total_Score FROM RankWithTotal GROUP BY Car_Make ORDER BY Rank;


CREATE TABLE TopThree_Car(
   ...> Rank int,
   ...> Car_Make text,
   ...> Car_ID int,
   ...> Total_Score int);

INSERT INTO TopThree_Car(Rank, Car_Make,Car_ID,Total_Score) SELECT * FROM RankTopOne UNION SELECT * FROM RankTopTwo UNION SELECT * FROM RankTopThree ORDER BY Car_Make, rank;

.mode csv
.output extract2.csv
SELECT * FROM TopThree_Car;




