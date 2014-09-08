#!/bin/bash

module load autodock/4.2

cd $PBS_O_WORKDIR
aprun -n 4 /N/soft/cle4/autodock/4.2/bin/autodock4 -p ind.dpf -l ind.dlg 
