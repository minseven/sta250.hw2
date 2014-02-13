#!/usr/bin/python

import sys
import os

table={}
for filename in os.listdir('.'):
	field=filename.split('.')
	if filename.startswith('ftable') and len(field) == 3:
		file=open(filename,'r')
		for line in file.xreadlines():
			line=line[:-1]
			element=line.split('\t')
			try:
				v=table[element[1]]
				table[element[1]]=v+int(element[0])
			except:
				table[element[1]]=int(element[0])
#out=open('ftable.Rp.txt','w')
for v in table:
	#out.write(str(table[v])+'\t'+v+'\n')
	print str(table[v])+'\t'+v
