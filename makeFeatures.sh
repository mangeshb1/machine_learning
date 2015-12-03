./mkcollection -c train.mf  "/home/jivjot/git/musicGenre/random/Train" 
#./bextract -n -fe -mfcc "train.mf" -w train.arff    ##overall features 
./bextract -n -sv -mfcc "train.mf" -w train.arff    ##overall features 
java weka.core.converters.CSVSaver -i MARSYAS_EMPTYtrain.arff -o train.csv
cat train.csv | rev | cut -d"," -f1 --complement|rev > train1.csv
cp train1.csv train.csv
rm train1.csv
