#!/bin/bash
#
#$ -cwd
#$ -V
#$ -j y
#$ -S /bin/bash
#$ -m e
#$ -M minseven77@gmail.com

DIR=$1
c=1
for file in $(/bin/ls $DIR/*.csv | grep -v _)
do
	qsub ./run_Rp2.sh $file FIRST $c
	c=$(($c+1))
done

for file in $(/bin/ls $DIR/*.csv | grep _)
do
	qsub ./run_Rp2.sh $file SECOND $c
	c=$(($c+1))
done
