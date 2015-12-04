args = commandArgs(trailingOnly=TRUE)
train=read.csv(args[[1]])
train=data.matrix(train)
mTrain=colMeans(train)
train = train - mTrain
sig=apply(train, 2, sd)
train = train / sig

write.csv(mTrain,'DATA/mean',row.names = FALSE)
write.csv(sig,'DATA/sigma',row.names = FALSE)
#write.csv(train,'dump1')
