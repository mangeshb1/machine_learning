clear all
train = csvread('DATA/Train.csv');
train = train(2:end,:); 
#remove header
labels = csvread('DATA/labelsNTrain.txt');
labels = labels(2:end,:);
trainParams = '-b 1 -c 32768.0 -g 0.0001220703125';
#trainParams = '-v 10'
model = svmtrain(labels,train,trainParams);
save 'models/svmTrainedModel' model
#train=sparse(train);
#libsvmwrite('SPECTFlibsvm.train',labels,train);
