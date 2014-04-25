#Read data tables
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
#rename variables for activities
y_train$Activity=activity_labels[y_train$V1,2]
y_train$V1=NULL
#add column with subjects and rename variable
y_train=cbind(y_train,subject_train)
y_train$Subject=y_train$V1
y_train$V1=NULL
#rename variables in X_train data frame from features data_frame
names(X_train)<-features$V2
# Read test data files from working directory and repeat labeling operations
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
# add column with subjects and rename variable
y_test$Activity=activity_labels[y_test$V1,2]
y_test$V1=NULL
#add column with subjects and rename variable
y_test=cbind(y_test,subject_test)
y_test$Subject=y_test$V1
y_test$V1=NULL
#rename variables in X_train data frame from features data_frame
names(X_test)<-features$V2
# bind all data frames in data frame "run"
train<-cbind(y_train,X_train)
test<-cbind(y_test,X_test)
run<-rbind(train,test)
#Create a vector containing row numbers of features containing mean and SD values
features_needed_rows<-c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:428,503:504,516:517,529:530,542:543)
#Correct vector to include Activity and Subject variables
variables_needed<-c(1,2,features_needed_rows+2)
#Subset dataframe "run" to include only needed variables
run_small<-run[,variables_needed]
# Load library data.table
library(data.table)
#Convert data frame to data table
run_small<-as.data.table(run_small)
#Calculate means of all columns grouped by Subject and Activity
run_analysis <- run_small[, lapply(.SD, mean), by=list(run_small$Subject,run_small$Activity), .SDcols = 3:67]
#Convert data table back to data frame
run_analysis<-as.data.frame(run_analysis)
# Rename back two first columns
names(run_analysis)[1]<-"Subject"
names(run_analysis)[2]<-"Activity"
# Write run_analysis.csv file to working directory
write.csv(run_analysis,"run_analysis.csv")