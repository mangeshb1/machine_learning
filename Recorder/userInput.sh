python songFeatureExtractor.py .
sleep 5
./makeFeatures.sh output user
octave svmModelPredictUser.m DATA/user.csv DATA/svmUser
Rscript NaiveBayesPredict.r DATA/Joineduser.csv DATA/naiveUser
Rscript kNearestPredict.r DATA/Joineduser.csv DATA/knnUser
Rscript WVoting.r DATA/svmUser DATA/naiveUser DATA/knnUser
