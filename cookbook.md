train.x: train/X_train.txt 

train.y: train/y_train.txt

train.subject: train/subject_train.txt

test.x: test/X_test.txt

test.y: test/y_test.txt

test.subject: test/subject_test.txt

feature: feature.txt

activity.label: activity_labels.txt

alldata.x: rbind train.x and test.x

alldata.y: rbing train.y and test.y

alldata.subject: rbind train.subject and test.subject

extractdata.x: grep 'mean()' and 'std()' columns from alldata.x

extractdata: cbind alldata.subject,alldata.y and extractdata.x

result: extractdata's mean data group by extract$subject,extract$activity 