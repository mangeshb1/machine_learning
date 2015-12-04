clear all
arg_list = argv ();
load 'models/svmTrainedModel' 
train = csvread(arg_list{1});
train = train(2:end,:); 
#remove header
labels = csvread(arg_list{2});
labels = labels(2:end,:);

[predicted_label, accuracy, prob_estimates] = svmpredict(labels,train,model,'-b 1');
prob_estimates(:,model.Label) = prob_estimates;
prob_estimates = [1:10;prob_estimates];

csvwrite(arg_list{3},prob_estimates);
predicted_label(1)
labels(1)
sum(predicted_label == labels)
%csvwrite('temp',predicted_label);
