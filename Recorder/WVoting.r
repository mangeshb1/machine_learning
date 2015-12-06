args = commandArgs(trailingOnly=TRUE)

## SVM
svmRes<-read.csv(args[[1]])

##
bayesRes<-read.csv(args[[2]])
##
kNNRes<-read.csv(args[[3]])

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

