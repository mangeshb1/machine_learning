if [ $# -ne 3 ]; then
  exit 1
fi
rm labels.txt
touch labels.txt
rm labelsN.txt
touch labelsN.txt
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
echo $labelName >> labels.txt
./labelMap.sh $labelName >> labelsN.txt 
echo $path
if [ $rNo -lt $2 ]
then 
cp $path $1/Train
elif [ $rNo -lt $3 ]
then
cp $path $1/Val
else
cp $path $1/Test
fi
done
done
