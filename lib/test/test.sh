#!/bin/bash
#SBATCH -N1

cd /home/gmap/mrpm/marguina/install/umpi/lib/test

BASE=$HOME/install/umpi

function umpirun ()
{
  x=$1
  set -x
  LD_LIBRARY_PATH=$BASE/lib/$x ldd ./test-UMPI.x
  LD_LIBRARY_PATH=$BASE/lib/$x mpirun -np 4 ./test-UMPI.x
  set +x
}

module purge
module load intelmpi/2018.4.274
umpirun INTELMPI201804MT
module purge

~/SAVE/mpiauto/mpiauto \
  -np 4 --verbose --wrap --wrap-stdeo \
 --umpi-mpi-label INTELMPI201804MT --umpi-verbose \
 -- ./test-UMPI.x




