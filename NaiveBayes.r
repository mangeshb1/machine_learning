rm(list = ls())
library('e1071')
data=read.csv('DATA/JoinedTrain.csv')
cross=10
stepSize=nrow(data)/cross
vect=vector()
for( i in seq(1,nrow(data),stepSize))
{
	index = seq(i,i+stepSize-1)
	trainData=data[-index,]
	cross=data[index,]
	model <- naiveBayes(Label ~ ., data = trainData)
	p=predict(model,cross)
	vect =  c(vect,sum(p == cross$Label)*100/nrow(cross))
}
print(mean(vect))
model <- naiveBayes(Label ~ ., data = data)
saveRDS(model,file="models/RNaiveBayes.model")
