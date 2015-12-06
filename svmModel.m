clear all
train = csvread('DATA/Train.csv');
train = train(2:end,:); 
#remove header
labels = csvread('DATA/labelsNTrain.txt');
labels = labels(2:end,:);
#trainParams = '-v 10'
trainParams = '-b 1 -c 32768.0 -g 0.0001220703125';
model = svmtrain(labels,train,trainParams);
save 'models/svmTrainedModel' model





trainParams = '-b 1 -v 10 -c 32768.0 -g 0.0001220703125';
model = svmtrain(labels,train,trainParams);
print model
#train=sparse(train);
#libsvmwrite('SPECTFlibsvm.train',labels,train);
