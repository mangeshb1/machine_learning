args = commandArgs(trailingOnly=TRUE)
## labels
labels<-read.csv(args[[1]])

## SVM
svmRes<-read.csv(args[[2]])

##
bayesRes<-read.csv(args[[3]])

##
best=0
for(i in seq(0.0,1.0,0.01))
{
weightSvm<-i
svmResW=svmRes*weightSvm
weightBayes<-1-i
bayesResW=bayesRes*weightBayes

aggRes=bayesResW
aggRes=bayesResW + svmResW
choice=apply(-aggRes,1,order)
acc =  sum(choice[1,] == labels)/nrow(labels)
if(best < acc)
{
best=acc
print(best)
print(i)
}
}
#print(labels[1,])
#print(choice[,1])
#print(aggRes[1,])
#print(svmRes[1,])
#print(bayesRes[1,])
#print(sum(labels == choice[1,]))
#print(sum(labels == choice[1,]))
