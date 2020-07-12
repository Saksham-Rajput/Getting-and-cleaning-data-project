Codebook :- 
1.activity - this variable tells to which activity the measurements correspond to. It can be one of six activities like walking, laying, etc.

2. subject - it represents the subject number from which the measurements were taken. It can be between 1 and 30.

for columns 3-81 : these represent the mean of the measurements taken from the different sensors in x,y,z axes.

Transformation for obtaining columns 3-81 :-
firstly we obtained the vector of length 561 containg different measurments.
Then we extracted only the measurements that calculated mean or standard deviation
of the respective parameters. Then after grouping the data by the activity and 
subject, we calculated the mean of all these measurements and put them in the 
tidy data set.
    


