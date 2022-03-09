## Data Dictionary

### Cars
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
|P|Car_ID|INT|||Primary key of a tabel| 
||Car_Year|INT|||Car information such as year|
||Car_Make|TEXT||Car information such as make|
||Car_Model|TEXT||Car information such as model|
||Owner_Name|TEXT|||Owner information such as name|
||Owner_Email|TEXT|||Owner information such as email|

### Judges
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
||Judge_ID|TEXT|||Judge information such as id|
||Judge_Name|TEXt|||Judge information such as name|

### Car_Score
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
|P|Car_ID|INT|||Primary key of a tabel|
||Car_Score|INT|||Scores for each car|

### Rank
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
|P|Car_Rank|INT|||Primary key of a tabel|
|F|Car_ID|INT|||ID for each car|
||Car_Year|INT|||Car information such as year|
||Car_Make|TEXT||Car information such as make|
||Car_Model|TEXT||Car information such as model|

### TopThree_Car
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
|P|Rank|INT|||Primary key of a tabel|
|F|Car_ID|INT|||ID for each car|
||Car_Make|TEXT||Car information such as make|
||Total_Score|INT||Total scores for each car|

### newJudges_Table
|P/F|Field Name|Data Type|Field Size|Description|
|-----------|---------|---------|------------|-----------|
||Judge_ID|TEXT|||Judge information such as id|
||Judge_Name|TEXt|||Judge information such as name|
||NumberOfCar|INT|||Counts the number of cars each judge has judged for the day|
||Start_Time|DATETIME||A field that shows the ‘start’ or the first timestamp of judging for the day|
||End_Time|DATETIME|||A field that shows the ‘end’ or the final timestamp of judging for the day|
||Duration|INT|||The duration between start and end times|
||Average_speed|INT||||An ‘average’ speed score that is a calculated as duration divided by number of cars judged|











