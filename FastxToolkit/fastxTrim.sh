#!/bin/bash

#edit the options to change parameters
#run this script with 'bash fastxTrim.sh'


echo "Starting fastx trimmer"
date
/N/soft/mason/galaxy-apps/fastx_toolkit_0.0.13/fastx_trimmer \
	-Q 33 \  #required setting - always 33 for Illumina data
	-f 10 \   #number of first base to keep
	-i 127419-7_S7_L001_R1_001.fastq \       #input file name
	-o 127419-7_S7_L001_R1_001.trimmed.fastq #output file name
echo "Done"
date
