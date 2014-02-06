ptm<-proc.time() # start checking processing time
require(plyr)

# fuction that returns sum of occurences, that is, number of entries
ft_sum <- function(ftable) {
        return(sum(ftable[,1]))
}

# function that measures the mean
ft_mean <- function(ftable,sum) {
        total=0
	return(sum(ftable[,1]*ftable[,2])/sum)
}

# function that measures standard deviation
ft_std <- function(ftable,mean,sum) {
	total=sum((ftable[,2]-mean)*(ftable[,2]-mean)*ftable[,1])
	return(sqrt(total/(sum-1)))
}

# function that measures median
ft_med <- function(ftable,sum) {
	csize=0
	med=0
	for(i in 1:length(ftable[,1])) {
		if(csize < sum/2 && sum/2 <= csize+ftable[i,1]) {
			med=ftable[i,2]
			break
		}
		csize=csize+ftable[i,1]
	}
	return(med)
}

# load the file and make the frequency table
ftable=system(sprintf("cat %s | sort -k 2 -g -r | grep -v NA | awk \'{ print $1 \"\t\" $2}\'",commandArgs()[4]),intern=TRUE)
#ftable=system(sprintf("cat %s",commandArgs()[4]),intern=TRUE)
ftable=ldply(strsplit(ftable,'\t'))
ftable$V1=as.numeric(ftable$V1)
ftable$V2=as.numeric(ftable$V2)

sum=ft_sum(ftable)
mean=ft_mean(ftable,sum)
std=ft_std(ftable,mean,sum)
med=ft_med(ftable,sum)
proc_time=proc.time()-ptm
cat("Mean: ",mean,"\n")
cat("Std: ",std,"\n")
cat("Med: ",med,"\n")
cat("Time: ",proc_time[3],"\n")
info=list(proc_time=proc_time[3], time = time, results = c(mean = mean, median = med, sd = std),system = Sys.info(),  session = sessionInfo())
save(info,file="results1p.rda")

