#!/bin/sh
module swap PrgEnv-cray PrgEnv-gnu
module load fftw
module load cudatoolkit
module load lammps

#mv $1 .
cd $PBS_O_WORKDIR #change to the working directory
aprun -n 4 /N/soft/cle4/lammps/lammps-27Aug13/bin/lmp_xe6 < in.friction
echo "LAMMPS_Simulation_Log=`pwd`/log.lammps"

exit 0
