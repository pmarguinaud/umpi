#!/bin/bash

set -x

CMP=PGI231

$HOME/install/gmkpack_support/wrapper/UMPI/mpif90 \
$HOME/install/gmkpack_support/wrapper/$CMP/f90 \
 -o test-UMPI.x -g test.F90



