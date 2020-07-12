setwd("C:/Users/user/Documents")
testx <- read.delim("X_test.txt", header = FALSE) 
## opening required documents
trainx <- read.delim("X_train.txt", header = FALSE)
testy <- read.delim("y_test.txt", header = FALSE)
trainy <- read.delim("y_train.txt", header = FALSE)
actlabel <- read.delim("activity_labels.txt", header = FALSE)
features <- read.delim("features.txt", header = FALSE)
testsubject <- read.delim("subject_test.txt", header = FALSE)
trainsubject <- read.delim("subject_train.txt", header = FALSE)
x <- cbind(testx, testy, testsubject)   
##combing data with activity and subject
y <- cbind(trainx, trainy, trainsubject)
colnames(x) <- c("1", "activity", "subject")
colnames(y) <- c("1", "activity", "subject")
library("dplyr")
library("tidyr")
data <- bind_rows(x,y)     
##merging training and test data
for(i in 1:10297){data[i,1] <- sub("  ", "", data[i,1])}
data <- separate(data, 1, features[,1], sep = "\\s+")
for(i in 1:561){data[,i] <- as.numeric(data[,1])}
col_to_take <- grep("mean|std", features[,1]) 
##extracting columns with mean or std
data <- data[, c(col_to_take, 562,563)]
names(data) <- gsub("[[:digit:]]", "", names(data))
actlabel[,1] <- sub("[[:digit:]]", "", actlabel[,1])  
##adding activity labels
k<-1
for(i in data[,80]){  data[k,80]<- actlabel[i,1]
k <- k+1}
newdata <- group_by(data, activity, subject) 
##making the data required in step 5
newdata2 <- summarise_if(newdata, is.numeric, mean, na.rm=TRUE) ##
write.table(newdata2, "tidydata.txt", row.names = FALSE)
