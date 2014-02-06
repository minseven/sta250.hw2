#!/bin/bash
#
#$ -cwd
#$ -V
#$ -j y
#$ -S /bin/bash
#$ -m e
#$ -M minseven77@gmail.com

file=$1
OPTION=$2
c=$3
if [ $OPTION == FIRST ]
then
	#echo $FILE $OPTION $PREFIX
	cut -d , -f 15 $file | sed '1d' | sort -g | uniq -c | sort -k 2 -g -r | awk '{print $1 "\t" $2}' > arrdelay.$c.txt
else
	echo $FILE $OPTION $PREFIX
	cut -d , -f 45 $file | sed '1d' | grep . | sort -g | uniq -c | sort -k 2 -g -r | awk '{ print $1 "\t" $2}' > arrdelay.$c.txt
fi
