#!/bin/bash
  
  #PBS -l nodes=4:ppn=32
  #PBS -l walltime=00:10:00
  #PBS -N my_job
  #PBS -V
  #PBS -q cpu
  
#  cd /path/to/working/directory
  aprun -n 128 /N/soft/cle4/wrf/3.5/WRFV3/main/wrf.exe >& wrf.log
#Verify if WRF ran succeesfully
if grep --quiet "SUCCESS COMPLETE WRF" rsl.out.0000; then
  echo WRF Completed Successfully

  echo "WRF_Output=`pwd`/wrfout_d01_2000-01-24_12:00:00"
  echo "WRF_Execution_Log=`pwd`/rsl.out.0000"

  exit 0
else
  echo WRF Execution Failed, Check rsl out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi
