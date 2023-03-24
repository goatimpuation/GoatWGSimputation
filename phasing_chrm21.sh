#!/bin/bash
#SBATCH --job-name="GoatWGSPhasingChrm19"   #name of this job
#SBATCH -p short              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 40                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 05:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=mahesh.neupane@usda.gov   #enter your email address to receive emails
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, prints our standard error
date                          #optional, prints out timestamp at the start of the job in stdout file
module load beagle-geno            #loading latest NCBI BLAST+ module
java -Xmx50g -jar /software/7/apps/beagle-geno/5.3/beagle.08Feb22.fa4.jar gt=vargoats_snps_1372_20201008_19_filtered.vcf.gz out=vargoats_snps_filtered_1372_beagle5.3_chr19_phased  # PhasingChrm19
date                          #optional, prints out timestamp when the job ends
#End of file

