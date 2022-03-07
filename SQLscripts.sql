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
