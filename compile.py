import os
import sys


def main():

	for i in range(1,548):
		command = '..\mxmlc.exe AS_'+str(i)+'.as -o AS_'+str(i)+'.swf';
		os.system(command)
	os.system('copy *.swf z:\server\swf\ ')



if __name__ ==  '__main__':
	main()