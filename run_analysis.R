
dataStructure<-c()

for(i in 1:5){

dataStructure<- cbind(dataStructure, t(rep("double",6)) )
dataStructure<- cbind(dataStructure, t(rep("NULL",34))  )

}

for(i in 1:5){

dataStructure<- cbind(dataStructure, t(rep("double",2 )) )
dataStructure<- cbind(dataStructure, t(rep("NULL",11) ))

}

for(i in 1:3){

dataStructure<- cbind(dataStructure, t(rep("double",6)) )
dataStructure<- cbind(dataStructure, t(rep("NULL",73))  )

}

for(i in 1:4){

dataStructure<- cbind(dataStructure, t(rep("double",2 )) )
dataStructure<- cbind(dataStructure, t(rep("NULL",11) ))

}


dataStructure<- cbind(dataStructure, t(rep("NULL",7)))


namesVector<-read.table("./features.txt", colClasses=c("NULL","character"), header=FALSE)

X_train <- read.table("./train/X_train.txt", quote="\"", colClasses=dataStructure, col.names=t(namesVector), header=FALSE);
Y_train <- read.table("./train/Y_train.txt", quote="\"", colClasses=c("integer"), col.names=c("ActivityLabelID"), header=FALSE);
S_train <- read.table("./train/subject_train.txt", quote="\"", colClasses=c("integer"), col.names=c("SubjectID"), header=FALSE);
all_train<-cbind(X_train,Y_train,S_train )

X_test <- read.table("./test/X_test.txt", quote="\"", colClasses=dataStructure, col.names=t(namesVector), header=FALSE);
Y_test <- read.table("./test/Y_test.txt", quote="\"", colClasses=c("integer"), col.names=c("ActivityLabelID"), header=FALSE);
S_test <- read.table("./test/subject_test.txt", quote="\"", colClasses=c("integer"), col.names=c("SubjectID"), header=FALSE);
all_test<-cbind(X_test,Y_test,S_test )

all_data<-rbind(all_train,all_test)

activityLabels<-read.table("./activity_labels.txt", colClasses=c("integer","character"), col.names=c("ActivityLabelID","ActivityName"), 

header=FALSE)

merged_data<-merge(all_data,activityLabels,by.x="ActivityLabelID")



aggr_data<-aggregate(merged_data,by=list(ActivityLabelID=merged_data$ActivityLabelID,AcivityName = merged_data$ActivityName,SubjectID = merged_data$SubjectID), FUN=mean)


aggr_data<-aggr_data[-c(1,4,71, 72)]

write.table(aggr_data, file="./result.txt")
