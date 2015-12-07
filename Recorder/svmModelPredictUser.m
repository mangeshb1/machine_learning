clear all
arg_list = argv ();
load 'models/svmTrainedModel' 
train = csvread(arg_list{1});
train = train(2:end,:); 
#remove header
labels = zeros(size(train,1),1);

[predicted_label, accuracy, prob_estimates] = svmpredict(labels,train,model,'-b 1 -q 1');
prob_estimates(:,model.Label) = prob_estimates;
prob_estimates = [1:10;prob_estimates];
csvwrite(arg_list{2},prob_estimates);
%csvwrite('temp',predicted_label);
