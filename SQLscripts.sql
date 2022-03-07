CREATE TABLE judges(
   ...> Judge_ID text,
   ...> Judge_Name text);
.import \judgesTable.csv judges;

CREATE TABLE scores (
   ...> Car_ID int primary key,
   ...> Car_Score int);
 .import \Car_Score.csv scores;

CREATE TABLE Cars(
   ...> Car_ID int primary key,
   ...> Car_Year int,
   ...> Car_Make text,
   ...> Car_Model text,
   ...> Owner_Name text,
   ...> Owner_Email text);
.import \carsTable.csv Cars
