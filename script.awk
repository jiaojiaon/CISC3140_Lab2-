BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
OFS = FS
Car_ID = $7
Car_Scores = "Car_Scores"
Year = $4
Car_Make = $5
Car_Model = $6
Owner_Name = $3
Owner_Email = $2
Judge_ID = $8
Judge_Name = $9
 
#printf ,Year \t Car_Make \t Car_Model \t Owner_Name \t Owner_Email \n" > "carsTable.csv"
#printf "Judge_ID \t Judge_Name \n" > "judgesTable.csv"
printf  $8, $9  > "judgesTable.csv"
printf $7, total  > "Car_Score.csv"
}
{
if(NR>1){
total =0;
for(i=10; i<= NF;i++){
total+=$i
}
print $7, total  > "Car_Score.csv"
print  $8, $9  > "judgesTable.csv"
print $7, $4, $5, $6,$3, $2  > "carsTable.csv"
}
}
END{
}
