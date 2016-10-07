#Variables
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Data
The data was originally sourced from Human Activity Recognition Using Smartphones Data Set, particularly the set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Transformations
The following steps are undertaken to take the raw data and create a tidy data set<br>
1. Download and unzip the data<br>
2. Read in all the data tables<br>
3. Combine the test and train dataframes<br>
4. Merge the dataframes, to associate the subject and activity to the specific observations<br>
5. Name the columns<br>
6. Limit the columns to only the subject, activity, mean and standard devation columns<br>
7. Clean up the column names to make them more "tidy"<br>
8. Add the activity labels<br>
9. Remove Activity column and move the ActivityLabel to the front for ease of use<br>
10. Sort the data to make it more tidy<br>
