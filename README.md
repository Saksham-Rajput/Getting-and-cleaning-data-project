# Getting-and-cleaning-data-project
Course project in getting and cleaning data
In this project i use the given data to make a tidy data set out of it using 
the code in the file in run_analysis.R .A tidy data set must meet some
conditions such as every observation should be in a different row, every should
contain a single variable, a table should have variables which are related to
one kind of observation.

Using the code in run_analysis.R i am able to meet these conditions of tidy data
set. The variables and transformation of variables are reported in a separate
file called codebook.md. 

In the analysis file, firstly i read all the required files for test and
training data. Then i combined the test data and training data together along
with their activities label and subject label using cbind and rbind. Then i
split the first column of merged data set into 561 columns because it contained
a vector of length 561 and gave appropriate column labels. Afterwards, i
extracted only the columns which contained mean or std in them as it was
required in the assignment. Lastly, I grouped the data according to activities
and subject and took mean of all the columns to get the final tidy dataset