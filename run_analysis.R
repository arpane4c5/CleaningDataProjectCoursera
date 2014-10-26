analyseSets<-function()
{
     #reading feature names and activity labels in a table
     featureNames<-read.table("./UCIDataset/features.txt",colClasses="character")
     labels<-read.table("./UCIDataset/activity_labels.txt")
     
     subTrain<-read.table("./UCIDataset/train/subject_train.txt")
     subTest<-read.table("./UCIDataset/test/subject_test.txt")
     
     
     # reading the training and test data
     trainSet<-read.table("./UCIDataset/train/X_train.txt",col.names=featureNames$V2,colClasses="numeric")
     testSet<-read.table("./UCIDataset/test/X_test.txt",col.names=featureNames$V2,colClasses="numeric")
     trainSet<-cbind(trainSet,subject=subTrain[,1])
     testSet<-cbind(testSet,subject=subTest[,1])

     
     #merging both the datasets
     mergedSet<-merge(trainSet,testSet,all=TRUE)
     
     #required features
     reqFeatureIndex<-grep(paste(c("mean","std"),collapse="|"),featureNames$V2)
     
     
     reqSet<-mergedSet[,reqFeatureIndex]
     
     
}