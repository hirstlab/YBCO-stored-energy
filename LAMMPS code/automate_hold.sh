#!/bin/bash

#SBATCH --job-name=lammps-ybco
#SBATCH -o myScript.sh.log-%j

#SBATCH -o %j.log

#SBATCH -e %j.err

#SBATCH --ntasks-per-node=32

#SBATCH --cpus-per-task=1

#SBATCH -N 8

#SBATCH --partition=xeon-p8


# Define the defect numbers
temps=(1 10 20 40 92 150 200 250 300)
defects=(468 936 1872 3744 7488) #0.5, 1, 2, 4, 8 mdpa

# Loop over each defect number
for temp in "${temps[@]}"
do
    for defect in "${defects[@]}"
    do
        cp hold_new.txt ./$temp/$defect
        cp hold.sh ./$temp/$defect
        cd ./$temp/$defect
        sed -i "s/221/$defect/g" hold_new.txt
        sed -i "s/611/$temp/g" hold_new.txt

        # Run LAMMPS using sbatch
        sbatch hold.sh
        cd ..
        cd ..
    done
done
