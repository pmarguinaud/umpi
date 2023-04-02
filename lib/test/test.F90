PROGRAM TEST

IMPLICIT NONE
#include "mpif.h"

CALL DOTEST

CONTAINS

SUBROUTINE DOTEST

integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)

call MPI_INIT(ierror)
call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
print*, 'node', rank, ': Hello world', size
call MPI_FINALIZE(ierror)


END SUBROUTINE 


END PROGRAM
