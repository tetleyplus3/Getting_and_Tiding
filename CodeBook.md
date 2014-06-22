## all_data.txt
### Variables
My project solution consists in taking the raw data provided by Anguita, Ghio, Oneto, Parra and Reyes-Ortiz [1] and putting all elements together so I end up wit a single data base containing a tidy data set, which can be manipulated in such a way that the user can get any data, a subset of data, summary values, and so on.

The tidy data set was completed according to the following assumptions and/or steps
- The pre-processed train data is contained in x_train
- The file subject_train contains the "subject id" for each row in x_train
- The file y_train contains a numerical code for the activity the subject was performing at the time of the recording
- File activity_label contains the names of the activities according, with their corresponding numerical code
- Combining y_train and activity_label, we can obtain a factor variable which describes with words the activity performed by each subject
- The file features.txt contains the column names for the x_train file
- I considered the names conatind in features very descriptive of the data, therefore I kept these names as the column names
- The tidy data set  





[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



