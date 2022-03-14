lab2:
	awk -f script.awk data_lab2/data.csv 
	sqlite3 Lab2db.db < script.sql
