#Variables
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Data
The data was originally sourced from Human Activity Recognition Using Smartphones Data Set, particularly the set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

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
