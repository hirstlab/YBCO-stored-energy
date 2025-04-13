This repository contains the input files, MD scripts, resulting data, and MATLAB code used to generate plots in "Quantifying stored energy release in irradiated YBa2Cu3O7 through molecular dynamics annealing simulations"

1) Potentials
   - This folder contains the input files needed for running LAMMPS code with the potentials created by ST Murphuy (10.1088/2399-6528/abc9a7) and SL Chaplot (10.1103/PhysRevB.42.2149). All simulations in this repository have been run with the Murphy potential, while the Chaplot potential was only used for 0K defect analysis (defect insertion script - mdpa.txt).

2) Data
   - This folder contains xlsx files with potential energy data from each round of simulations. Each round evaluated YBCO at a range of temepratures (1-300K) and a range of DPA (0-8 mDPA).
  
3) LAMMPS code
   - This foler contains LAMMPS scripts and shell files for running on a supercomputer. To evaluate the potential energy of a cell at temperature, the YBCO supercell is heated via warmup.txt, defects are inserted using mdpa.txt, and annealed at temperature using hold.txt. automate.sh is used to run the warmup.txt code across temperatures. automate_hold.sh is used to anneal cells for each temperature and mDPA.

4) MATLAB code
   - This folder contains the code that was used to generate the published plots.
   - All data from the data file will be needed to run averaging_temperature_sims.m, which is used to process and average the xlsx data. All of the plotting codes call on variables created via averaging_temperature_sims.m, so this must be run beforehand. 
   - Published figures were generated via:
     - Figure 2: chaplot_murphy_0K.m
     - Figure 3: energy_vs_time.m
     - Figure 4: mdpa_vs_energy.m
     - Figure 5a: extrapolation_stored.m
     - Figure 5b: extrap_released.m
