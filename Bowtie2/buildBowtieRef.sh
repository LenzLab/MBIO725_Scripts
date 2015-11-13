#!/bin/sh

#script to build a bowtie reference, if it doesn't already exist

#   VARIABLES

#the name of this reference; reference files will have this name
REFNAME=Alaska_longest
date

# check whether the reference index files do exist. If they do not, we will 
# need to create them
if [ ! -f $REFNAME.1.bt2 ]
then
    echo "No reference index found. We need to create it"

    # create the reference index files for mapping
    echo "start creating index files" 
    date

    # -f before input for build command says input files are fasta files
    #-q option suppresses verbose messages
    bowtie2-build -f $REFNAME.fasta $REFNAME 
    echo "end creating index files "
    date
else
    echo "This reference already exists here, check variable settings and try again"
fi

date

