#!/bin/bash

mikado configure --list list.txt --reference small_genome.fa --mode nosplit --scoring mammalian.yaml --seed 1234 -t 25 --minimum-cdna-length 100 mkconf.yaml

#run prepare
mikado prepare --json-conf mkconf.yaml -m 100 -p 25 --seed 1234 -o m1.gtf -of m1.fasta
mikado prepare --json-conf mkconf.yaml -m 100 -p 25 --seed 1234 -o m2.gtf -of m2.fasta
mikado prepare --json-conf mkconf.yaml -m 100 -p 25 --seed 1234 -o m3.gtf -of m3.fasta
mikado prepare --json-conf mkconf.yaml -m 100 -p 25 --seed 1234 -o m4.gtf -of m4.fasta
mikado prepare --json-conf mkconf.yaml -m 100 -p 25 --seed 1234 -o m5.gtf -of m5.fasta

diff -q --from-file m1.fasta m2.fasta m3.fasta m4.fasta m5.fasta; echo $?
