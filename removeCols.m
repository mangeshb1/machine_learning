A = csvread('train.csv');
A = A(2:end,1:end-1);
csvwrite('trainOctave.csv',A);	
