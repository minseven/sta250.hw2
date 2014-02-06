#!/bin/bash
#
#$ -cwd
#$ -V
#$ -j y
#$ -S /bin/bash
#$ -m e
#$ -M minseven77@gmail.com

./run_Rp3.py
R --slave --args "arrdelay.Rp.txt" < run_Rp3.R 
