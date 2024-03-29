#!/bin/bash
mv $1 .
mv $2 .

module swap PrgEnv-cray PrgEnv-gnu
module load fftw
module load gromacs/gnu/single/4.6.5

aprun -n 4 /N/soft/cle4/gromacs/gnu/single/4.6.5/bin/mdrun_mpi -v -deffnm pdb1y6l-EM-vacuum.tpr -c pdb1y6l-EM-vacuum.gro 


#Verify if GROMACS ran succeesfully
if grep --quiet "Finished mdrun" pdb1y6l-EM-vacuum.tpr.log; then
  echo GROMACS Completed Successfully

  echo "GROMACS_Execution_Log=`pwd`/pdb1y6l-EM-vacuum.tpr.log"
  echo "Full_Precision_Trajectory_file =`pwd`/pdb1y6l-EM-vacuum.tpr.trr"
  echo "Portable_Energy_file =`pwd`/pdb1y6l-EM-vacuum.tpr.edr"

  exit 0
else
  echo GROMACS Execution Failed, Check out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi

