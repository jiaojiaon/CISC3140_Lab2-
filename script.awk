BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","

Judge_ID = $8
Judge_Name = $9

printf " Car_ID \t Year \t Car_Make \t Car_Model \t Owner_Name \t Owner_Email \n" > "carsTable.csv"
printf "Judge_ID \t Judge_Name \n" > "judgesTable.csv"
printf "Car_ID \t Car_scores  \n" > "Car_Score.csv"
}
{
if(NR>1){
total =0;
for(i=10; i<= NF;i++){
total+=$i
}
printf "\t"$7"\n" total  > "Car_Score.csv"
printf "\t "$8" \t "$9"\n" > "judgesTable.csv"
printf "\t "$7" \t "$4" \t "$5" \t "$6" \t "$3" \t "$2" \n" > "carsTable.csv"
}
}
END{
}
