echo $1
echo $2

if [ $# -ne 2 ]; then
  exit 1
fi
mkdir DATA

./mkcollection -c DATA/$2.mf  $1
#./bextract -n -fe -mfcc "train.mf" -w train.arff    ##overall features 
#./bextract  -n -sv -mfcc "train.mf" -w train.arff    ##overall features 
./bextract  -n -sv  "DATA/$2.mf" -w temp.arff    ##overall features 
#./bextract  -n -fe "train.mf" -w train.arff    ##overall features 
mv MARSYAS_EMPTYtemp.arff DATA/MARSYAS_EMPTY$2.arff
java -cp weka.jar weka.core.converters.CSVSaver -i DATA/MARSYAS_EMPTY$2.arff -o DATA/$2.csv
cat DATA/$2.csv | rev | cut -d"," -f1 --complement|rev > DATA/$2tmp.csv
cp DATA/$2tmp.csv DATA/$2.csv
rm DATA/$2tmp.csv
echo Label > DATA/labels$2.txt
echo Label > DATA/labelsN$2.txt

cat DATA/MARSYAS_EMPTY$2.arff |grep filename | cut -d"." -f1| rev |cut -d"/" -f1|rev >> DATA/labels$2.txt
for d in `cat DATA/labels$2.txt`
do 
./labelMap.sh $d >> DATA/labelsN$2.txt
done
paste DATA/$2.csv DATA/labels$2.txt -d","> DATA/Joined$2.csv

java -cp weka.jar weka.core.converters.CSVLoader  DATA/Joined$2.csv > DATA/Joined$2.arff
