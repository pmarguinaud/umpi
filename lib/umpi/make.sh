#!/bin/bash

f90="gfortran -fno-second-underscore"

set -x
set -e

\rm -f *.o

cc -fPIC -g -c umpi_start.c
ar crv ../libumpiBOOT.a umpi_start.o 

MPI=INTELMPI201804MT
mpif90=$HOME/install/gmkpack_support/wrapper/$MPI/mpif90 
mpicc=$HOME/install/gmkpack_support/wrapper/$MPI/mpicc

\rm -f *.o

$mpif90 $f90 -fPIC -g -c -fPIC umpi_initf.F90

mkdir -p ../$MPI
$mpif90 gfortran -shared -o ../$MPI/libumpi.so *.o 

# ------------

\rm -f *.o

$f90 -I../../include -g -c -fPIC umpi_initf.F90 
cc -c -fPIC umpi_stubs.c

cc -shared -o ../libumpi.so *.o

\rm -f *.o


# ------------



