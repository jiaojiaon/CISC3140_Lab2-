BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
OFS = ","
 
print "Year, Car_Make, Car_Model, Owner_Name, Owner_Email" > "carsTable.csv"
print "Judge_ID, Judge_Name" > "judgesTable.csv"
print "Car_ID, Car_Score" > "Car_Score.csv"
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
