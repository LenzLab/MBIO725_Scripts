#!/bin/bash -v

ulimit -s

#### run trinity with specific parameters
#

BASEDIR=`pwd`

## check argument count
if [ $# -ne 3 ]
then
    echo "Error in $0 - Invalid Argument Count"
    echo "Syntax: $0 left_reads right_reads output_dir"
    exit
fi

function join { local IFS="$1"; shift; echo "$*"; }


## check whether input files are existing
IFS=',' read -a leftArr <<< "$1"
leftFullArr=()

for fName in "${leftArr[@]}" 
do
	if [ ! -f $BASEDIR/$fName ]
	then
	        echo "Left read file [$BASEDIR/$fName] not found - Aborting"
	    exit
	else
		leftFullArr+=("$BASEDIR/$fName")
	fi
done
leftString=$(join , "${leftFullArr[@]}")


IFS=',' read -a rightArr <<< "$2"
rightFullArr=()
for fName in "${rightArr[@]}"
do
	if [ ! -f $BASEDIR/$fName ]
	then
	    echo "Right read file [$BASEDIR/$fName] not found - Aborting"
	    exit
	else
		rightFullArr+=("$BASEDIR/$fName")
	fi
done
rightString=$(join , "${rightFullArr[@]}")



date
Trinity \
           --seqType fq --left $leftString \
           --right $rightString \
           --output $BASEDIR/$3 \
           --max_memory 200G \
           --CPU 32 \
           --normalize_max_read_cov 50 \
           --min_contig_length 300 \
             > trinity.log 2> trinity.err
date

