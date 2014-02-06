#!/usr/bin/python

import sys
import os

table={}
for filename in os.listdir('.'):
	field=filename.split('.')
	if filename.startswith('arrdelay') and len(field) == 3 and field[1].isdigit():
		file=open(filename,'r')
		for line in file.xreadlines():
			line=line[:-1]
			element=line.split('\t')
			try:
				v=table[element[1]]
				table[element[1]]=v+int(element[0])
			except:
				table[element[1]]=int(element[0])
out=open('arrdelay.Rp.txt','w')
for v in table:
	out.write(str(table[v])+'\t'+v+'\n')
