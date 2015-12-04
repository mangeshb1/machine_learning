java -cp ./weka.jar weka.classifiers.Evaluation weka.classifiers.bayes.NaiveBayes -p 10 -distribution -l models/train.model -T $1
