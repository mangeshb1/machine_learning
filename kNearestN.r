rm(list = ls())
library('kknn')
data=read.csv('DATA/JoinedTrain.csv')
cross=10
stepSize=nrow(data)/cross
kN = 5
#for (kN in 1:100)
{
    vect=vector()
    for( i in seq(1,nrow(data),stepSize))
    {
        index = seq(i,i+stepSize-1)
        trainData=data[-index,]
        cross=data[index,]
        model <- kknn(Label ~ .,trainData,cross,k = kN,kernel = "gaussian")
        p=fitted(model)
        vect =  c(vect,sum(p == cross$Label)*100/nrow(cross))
    }
    print(kN)
    print(mean(vect))
}
saveRDS(data,file="models/knn.model")
saveRDS(kN,file="models/knnK.model")
