if [ $# -ne 3 ]; then
  exit 1
fi
labelsTrain=labelsTrain.txt
labelsNTrain=labelsNTrain.txt
labelsVal=labelsVal.txt
labelsNVal=labelsNVal.txt
labelsTest=labelsTest.txt
labelsNTest=labelsNTest.txt

rm $labelsTrain
rm $labelsNTrain
rm $labelsVal
rm $labelsNVal
rm $labelsTest
rm $labelsNTest


mkdir $1
mkdir $1/Train
mkdir $1/Val
mkdir $1/Test
for d in ` ls genres`
do 
for f in  `ls genres/$d`
do
path=genres/$d/$f
rNo=$(( RANDOM % 100 ))
labelName=`echo $path| cut -d"/" -f2`
echo $path
if [ $rNo -lt $2 ]
then 
cp $path $1/Train
echo $labelName >> $labelsTrain
./labelMap.sh $labelName >> $labelsNTrain
elif [ $rNo -lt $3 ]
then
cp $path $1/Val
echo $labelName >> $labelsVal
./labelMap.sh $labelName >> $labelsNVal
else
cp $path $1/Test
echo $labelName >> $labelsTest
./labelMap.sh $labelName >> $labelsNTest
fi
done
done
