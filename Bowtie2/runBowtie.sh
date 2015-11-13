#last edit: 15/4/2013


#!/bin/sh
#
# Script to run bowtie analysis
#
#

#
#Variable Descriptions
#

#REFBASE: the file path to the name of the bowtie reference 
#(no file extension: Labma_ref not Labma_ref.1.bt2)

#FORWARDINPUT: file path to the forward reads file
#REVERSEINPUT: file path to the matching reverse reads file

#OUTPUTNAME: the name of the main output samfile
#(.sam file extension should be included in this: sample1.sam, not sample1)

#LOGNAME: the name of the log files
#(no file extension: sample1 not sample1.log)

#INPUTTYPE: filetype for reads; use -q for fastq files

#OTHEROPTS: potential other arguments to bowtie2; usually leave this blank

date
# [ TRUE ] here to enable this until "fi", [ ] to disable. The spaces between the brackets are necessary.
if [ TRUE ] 
then
    REFBASE=/home/mbio725/bowtiedemo/reference/Alaska_longest
    FORWARDINPUT=/home/mbio725/bowtiedemo/reads/fillerfile1_R1.fastq
    REVERSEINPUT=/home/mbio725/bowtiedemo/reads/fillerfile1_R2.fastq
    OUTPUTNAME=filler1.sam  
    LOGNAME=filler1
    INPUTTYPE=-q
    OTHEROPTS=

    # run bowtie2 mapping with data set by variables above
    echo "start mapping on" $LOGNAME " data"
    bowtie2 $OTHEROPTS $INPUTTYPE -x $REFBASE -p 16 -1 $FORWARDINPUT -2 $REVERSEINPUT -S $OUTPUTNAME >$LOGNAME.log 2>$LOGNAME.err
    echo "end mapping on" $LOGNAME "data"
fi
date
