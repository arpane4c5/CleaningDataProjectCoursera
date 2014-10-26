# The function can be called simply by analyseSets()
analyseSets<-function()
{
     # reading feature names and activity labels
     featureNames<-read.table("./UCIDataset/features.txt",colClasses="character")
     actLabel<-read.table("./UCIDataset/activity_labels.txt",colClasses="character")
     # forming a character vector of the labels
     actLabel<-actLabel$V2
     
     # reading subject IDs and activity IDs of training and test data
     subTrain<-read.table("./UCIDataset/train/subject_train.txt",colClasses="numeric")
     subTest<-read.table("./UCIDataset/test/subject_test.txt",colClasses="numeric")
     actTrain<-read.table("./UCIDataset/train/y_train.txt",colClasses="numeric")
     actTest<-read.table("./UCIDataset/test/y_test.txt",colClasses="numeric")
     # adding columns for activity labels corresponding to the activity IDs
     actTrain[,2]<-actLabel[actTrain[,1]]
     actTest[,2]<-actLabel[actTest[,1]]
     
     # reading the training and test data
     setTrain<-read.table("./UCIDataset/train/X_train.txt",col.names=featureNames$V2,colClasses="numeric")
     setTest<-read.table("./UCIDataset/test/X_test.txt",col.names=featureNames$V2,colClasses="numeric")
     
     # extracting required features (mean and standard deviation values only)
     reqFeatureIndex<-grep(paste(c("mean","std"),collapse="|"),featureNames$V2)
     setTrain<-setTrain[,reqFeatureIndex]
     setTest<-setTest[,reqFeatureIndex]
     
     # column binding the activity names and the subject IDs
     setTrain<-cbind(subject_id=subTrain[,1],activity=actTrain[,2],setTrain)
     setTest<-cbind(subject_id=subTest[,1],activity=actTest[,2],setTest)
     
     # merging both the datasets
     cleanData<-rbind(setTrain, setTest)
     
     # writing the datasets to the text file named "cleanData.txt"
     write.table(cleanData,file="./cleanData.txt",row.names=FALSE)
}