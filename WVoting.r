args = commandArgs(trailingOnly=TRUE)
## labels
labels<-read.csv(args[[1]])

## SVM
svmRes<-read.csv(args[[2]])

##
bayesRes<-read.csv(args[[3]])

weightSvm<-0.95
weightSvm=1
svmResW=svmRes*weightSvm
weightBayes<-0.05
#weightBayes<-0
bayesResW=bayesRes*weightBayes

aggRes=bayesResW
aggRes=bayesResW + svmResW
choice=apply(-aggRes,1,order)
acc =  sum(choice[1,] == labels)/nrow(labels)
print(acc)
