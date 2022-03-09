# CISC3140_Lab2-

## Description
The objective of this lab is to work with another form of structured data from the command line, namely relational tables and some more practice with Git from command-line.

## Requirements

1. Update the submodule linked data file

2. Import the sample data into these tables in an SQLite3 database. You may have to create separate tables before you can import data:

o Cars table with primary key Car_ID and contains car information such as Year, Make, Model as well as owner information in [carsTable.csv](carsTable.csv)

o Judges table that contains Judge_ID, Judge Name in [judgesTable.csv](judgesTable.csv)

o Car_Score table that contains the scores for each car with Car_ID as the primary key in [Car_Score.csv](Car_Score.csv)

2. Using the database created with the tables noted above:

o Write a single SQLite3 query that shows the results for all cars (that query the correct tables). Compute the total score for each row. The output should show (ranking, car_id, year, car make, car model). Present the list in descending order using the total column and make sure you add a new ranking column. Export the results a file named [extract1.csv](extract1.csv). (Note: you may have to write multiple queries to figure out the single query)

o Write an SQLite3 query that shows for each Car Make grouping: a list of the top 3 cars of that Make. The output should contain at minimum the following fields: ranking, car make, car_id, total score. Export the results to a file named [extract2.csv](extract2.csv)

3. Update the Judges table with the following information. In [extract3.csv](extract3.csv), you will need to create new fields: 

o Counts the number of cars each judge has judged for the day

o A field that shows the ‘start’ or the first timestamp of judging for the day

o A field that shows the ‘end’ or the final timestamp of judging for the day

o The duration between start and end times

o An ‘average’ speed score that is a calculated as duration divided by number of cars judged.

4. In [SQLscripts.sql](SQLscripts.sql), your above work should be saved in *.sql file(s) and saved to your Git project repository. 


5. Provide a data dictionary for your final set of tables. This is a description of your table (or database) schema. Please name this file [data_dictonary.md](data_dictonary.md) and use markdown formatting to format it. 

6.Capture [text-based file(s)](history_log.txt) that contains a log of your terminal session (use the script command).


# Installation

Run using the command ```make lab2```

## Dependencies

* Sample Data: https://gist.github.com/katychuang/d66a59b6db4e59c16efd4c42ad411f8e
* BC Linux machines

## Setup

1. Sign up for a GitHub account if you don't have one. Set up your SSH keys with github.
2. Clone this repository `git clone git@github.com:jiaojiaon/CISC3140_Lab2-.git` to your machine to get a copy.
3. Move into the project's root directory with `cd CISC3140_Lab2-` 
4. Open SQLscripts.sql and follow the steps to create tables

