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
