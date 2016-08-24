! /bin/bash

# $1 = R1.fastq
# $2 = R2.fastq


module load star/2.5.1b


index='/hpc/users/xdangk01/REFERENCES/GRCh38/star/Gencode24'
prefix=`basename $1 .r1.fastq`

mkdir /hpc/users/xdangk01/AMPAD/reprocess/outputs/ROSMAP/star/$prefix
cd /hpc/users/xdangk01/AMPAD/reprocess/outputs/ROSMAP/star/$prefix

STAR --runMode alignReads --runThreadN 6 --genomeDir $index --readFilesIn $1 $2 --outFileNamePrefix $prefix --outSAMtype BAM Unsorted --outSAMunmapped Within --quantMode GeneCounts --twopassMode Basic
