#!/bin/bash

#edit the options to change parameters
#run this script with 'bash fastxQuality.sh'

echo "Starting quality filter"
date
/N/soft/mason/galaxy-apps/fastx_toolkit_0.0.13/fastq_quality_filter \
	-Q 33 \ #required setting - always 33 for Illumina data
	-q 30 \ #quality threshold (phred score)
	-p 70 \ # % of bases per read which must be at or above quality threshold
	-z \    #compresses output file-remove this line to not compress
	-i 127419-7_S7_L001_R1_001.trimmed.fastq \            #input file name
	-o 127419-7_S7_L001_R1_001.trimmed.quality.fastq.gz \ #output file name
	-v      #report number of sequences filtered
echo "Done"
date
