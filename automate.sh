#!/bin/bash

#SBATCH --job-name=NPT-warmup

#SBATCH -o myScript.sh.log-%j

#SBATCH -o %j.log

#SBATCH -e %j.err

#SBATCH --ntasks-per-node=10

#SBATCH --cpus-per-task=1

#SBATCH -N 2

#SBATCH --partition=xeon-p8


# Define the defect numbers
temps=(1 10 20 40 92 150 200 250 300)   


# Loop over each defect number
for temp in "${temps[@]}"
do
    mkdir $temp
    
    cp warmup.txt ./$temp
    cp warmup.sh ./$temp
    cp TABLE_s ./$temp
    cp YBCO.936000.0.data ./$temp
    
    cd ./$temp
    sed -i "s/311/$temp/g" warmup.txt
    
    # Run LAMMPS using sbatch
    sbatch warmup.sh
    cd ..

done
