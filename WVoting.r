library('caret')
args = commandArgs(trailingOnly=TRUE)
## labels
labels<-read.csv(args[[1]])

## SVM
svmRes<-read.csv(args[[2]])

##
bayesRes<-read.csv(args[[3]])
##
kNNRes<-read.csv(args[[4]])

weightSvm<-0.58
svmResW=svmRes*weightSvm
weightBayes<-0.09
#weightBayes<-0
bayesResW=bayesRes*weightBayes

weightkNN<-0.33
#weightBayes<-0
kNNResW=kNNRes*weightkNN

aggRes=bayesResW
aggRes=bayesResW + svmResW + kNNResW
choice=apply(-aggRes,1,order)
acc =  sum(choice[1,] == labels)/nrow(labels)
print(acc)
print(confusionMatrix(choice[1,],labels))
