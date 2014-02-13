[Part 1]

Method:

The method that I am using for the part 1 of this assignment is that parallelizing the file processing into cluster by using shell command and cluster system called SGE (Sun Grid Engine).
Parallelizing file processing will reduce significantly the computation time because we already observed that bottleneck of the computation is in file processing in assignment 1. 
Specifically, I am going to create the frequency table for each file and this is easily parallelized by running the same job that creates frequency table for different file. Once this step is finished, then we will have multiple frequency tables. So we need to combined into one frequency table, which wouldn't talke much time and then once we have a merged table, statistics are measured.  
 
Running codes:

(1) type run_Rp.sh $DIR where $DIR is the directory of all csv files. This commnad will run the qsub which is submission command of job in Sun Grid Engine. It will execute run_Rp2.sh which will create the frequency table for the input file. In other words, each file will be executed in parallel so that frequency table is generated for each of file.

(2) Once all the jobs have been finished, then type qsub ./run_Rp3.sh. This will measure all the statistics that we measured in HW1. To be specific, it will first run run_Rp3.py to gather all the separte frequency tables into one table file. And then ./run_Rp3.R will measure the statistics with the combined file.

[Part 2]

Method:

The method that I employ here is using R parallel package called "snow". It uses multiple cores in parallel for processing R functions.

Running codes:

(1) make sure that all csv files are in csv directory under home directory. 

(2) run R --slave < run_Rparallel.R
 
