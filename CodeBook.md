# CodeBook.md

## Raw data

The raw data is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Raw data files

#### Subject data
Each row identifies the subject who performed the activity for each sample. Its range is from 1 to 30.  
The data has been partitioned into training and test datasets, with a separate file for each.

```
/UCI HAR Dataset/train/subject_train.txt
/UCI HAR Dataset/test/subject_test.txt
```

#### Activity data
Each row identifies the activity for each sample. Its range is from 1 to 6.   
The data has been partitioned into training and test datasets, with a separate file for each.

```
/UCI HAR Dataset/train/y_train.txt
/UCI HAR Dataset/test/y_test.txt
```

#### Observation data
Each row is a record of observations from the accelerometers per subject per activity. There are 10,299 records in total.  
Each column represents an observation for a particular measure. There are 561 observations for each record.   
The data has been partitioned into training and test datasets, with a separate file for each.   

```
/UCI HAR Dataset/train/X_train.txt
/UCI HAR Dataset/test/X_test.txt
```

#### Activity lookup table
Links the class labels with their activity name.

```/UCI HAR Dataset/activity_labels.txt```

#### Observations/features lookup table
A list of all observations/features. There are 561 in total.   
More information on each feature can be found in the features_info.txt in the raw data zip file.

```/UCI HAR Dataset/features.txt```

## Tidy data



### combined_data
combined_data combines the training and test observation, activity and subject datasets for a subset of features (the mean and standard deviation of each measurement).   
Each row is a record of observations from the accelerometers per subject per activity. There are 10,299 records in total.    
Each variable represents an observation (mean or standard deviation) for a particular measure. There are 66 observations for each record.   

## Variables

The variables are listed in the table below. The number in square brackets at the beginning of each line shows the column index in combined_data for the left-most variable.

Index | Variable names               | Variable names                  | Variable names          
------|------------------------------|---------------------------------|--------------------------
 [4]  | "tBodyAcc-mean()-X"          |   "tBodyAcc-mean()-Y"           |  "tBodyAcc-mean()-Z"          
 [7]  | "tBodyAcc-std()-X"           |   "tBodyAcc-std()-Y"            |  "tBodyAcc-std()-Z"           
[10]  | "tGravityAcc-mean()-X"       |   "tGravityAcc-mean()-Y"        |  "tGravityAcc-mean()-Z"       
[13]  | "tGravityAcc-std()-X"        |   "tGravityAcc-std()-Y"         |  "tGravityAcc-std()-Z"        
[16]  | "tBodyAccJerk-mean()-X"      |   "tBodyAccJerk-mean()-Y"       |  "tBodyAccJerk-mean()-Z"      
[19]  | "tBodyAccJerk-std()-X"       |   "tBodyAccJerk-std()-Y"        |  "tBodyAccJerk-std()-Z"       
[22]  | "tBodyGyro-mean()-X"         |   "tBodyGyro-mean()-Y"          |  "tBodyGyro-mean()-Z"         
[25]  | "tBodyGyro-std()-X"          |   "tBodyGyro-std()-Y"           |  "tBodyGyro-std()-Z"          
[28]  | "tBodyGyroJerk-mean()-X"     |   "tBodyGyroJerk-mean()-Y"      |  "tBodyGyroJerk-mean()-Z"     
[31]  | "tBodyGyroJerk-std()-X"      |   "tBodyGyroJerk-std()-Y"       |  "tBodyGyroJerk-std()-Z"      
[34]  | "tBodyAccMag-mean()"         |   "tBodyAccMag-std()"           |  "tGravityAccMag-mean()"      
[37]  | "tGravityAccMag-std()"       |   "tBodyAccJerkMag-mean()"      |  "tBodyAccJerkMag-std()"      
[40]  | "tBodyGyroMag-mean()"        |   "tBodyGyroMag-std()"          |  "tBodyGyroJerkMag-mean()"    
[43]  | "tBodyGyroJerkMag-std()"     |   "fBodyAcc-mean()-X"           |  "fBodyAcc-mean()-Y"          
[46]  | "fBodyAcc-mean()-Z"          |   "fBodyAcc-std()-X"            |  "fBodyAcc-std()-Y"           
[49]  | "fBodyAcc-std()-Z"           |   "fBodyAccJerk-mean()-X"       |  "fBodyAccJerk-mean()-Y"      
[52]  | "fBodyAccJerk-mean()-Z"      |   "fBodyAccJerk-std()-X"        |  "fBodyAccJerk-std()-Y"       
[55]  | "fBodyAccJerk-std()-Z"       |   "fBodyGyro-mean()-X"          |  "fBodyGyro-mean()-Y"         
[58]  | "fBodyGyro-mean()-Z"         |   "fBodyGyro-std()-X"           |  "fBodyGyro-std()-Y"          
[61]  | "fBodyGyro-std()-Z"          |   "fBodyAccMag-mean()"          |  "fBodyAccMag-std()"          
[64]  | "fBodyBodyAccJerkMag-mean()" |   "fBodyBodyAccJerkMag-std()"   |  "fBodyBodyGyroMag-mean()"    
[67]  | "fBodyBodyGyroMag-std()"     |   "fBodyBodyGyroJerkMag-mean()" |  "fBodyBodyGyroJerkMag-std()" 

The text below is an extract from the file features_info.txt in the raw data zip file. It explains what each component of the variable names signifies.

```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
...
```

### Transformations

Transformations performed on the raw data to create combined_data are minimal:   

* Training and test observation datasets are merged to create one data set.
* The mean and standard deviation for each measurement are retained. All other statistics are discarded.
* Fields containing activity names, subject index and source index are added to the data set.
* The headers are labelled appropriately with the descriptive variable names shown above.

### 
