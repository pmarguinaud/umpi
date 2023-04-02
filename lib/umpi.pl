#!/usr/bin/perl -w

use FileHandle;
use strict;

mkdir ('umpi');

my @f_c = qw (
  MPI_SUCCESS
  MPI_MAX
  MPI_MIN
  MPI_SUM
  MPI_BXOR
  MPI_CHARACTER
  MPI_INTEGER
  MPI_INTEGER8
  MPI_LOGICAL
  MPI_BYTE
  MPI_REAL8
  MPI_REAL4
  MPI_COMM_WORLD
  MPI_COMM_NULL
  MPI_STATUS_SIZE
  MPI_MAX_ERROR_STRING
  MPI_TAG
  MPI_ANY_TAG
  MPI_SOURCE
  MPI_ANY_SOURCE
  MPI_UNDEFINED
  MPI_THREAD_MULTIPLE
  MPI_THREAD_SINGLE
  MPI_MODE_RDONLY
  MPI_MODE_WRONLY
  MPI_MODE_CREATE
  MPI_INFO_NULL
  MPI_INTEGER4
  MPI_DOUBLE_PRECISION
  MPI_2DOUBLE_PRECISION
  MPI_MINLOC
  MPI_MAXLOC
  MPI_REQUEST_NULL
);

my @f_f = qw (
  REAL*8 MPI_WTIME
);

my $fh = 'FileHandle'->new ('>umpi/umpif.h');

$fh->print ("INTEGER :: &\n", join (", &\n", map { sprintf ('  & %-50s', $_) } @f_c), "\n");
$fh->print ("COMMON / UMPICOM /  &\n", join (", &\n", map { sprintf ('  & %-50s', $_) } @f_c), "\n");

my @tmp;

@tmp = @f_f;
while (my ($type, $name) = splice (@tmp, 0, 2))
  {
    $fh->print ("$type, EXTERNAL :: $name\n");
  }

$fh->close ();

mkdir ('umpi');

$fh = 'FileHandle'->new ('>umpi/umpi_initf.F90');

$fh->print ("SUBROUTINE UMPI_INITF (KMPI)

INTEGER :: KMPI (*)

! This is the *real* mpif.h, not the one from umpi !
#include \"mpif.h\"

");

my $i = 0;

for my $f_c (@f_c)
  {
    $fh->printf ("KMPI (%3d) = %-30s\n", ++$i, $f_c);
  }

$fh->print ("\nEND SUBROUTINE UMPI_INITF\n");

$fh->print ("
SUBROUTINE UMPI_UMPIC

! Force COMMON load

#include \"umpif.h\"

END SUBROUTINE
");

$fh->close ();

my @f = qw (
MPI_ABORT
MPI_ALLGATHER
MPI_ALLGATHERV
MPI_ALLREDUCE
MPI_ALLTOALLV
MPI_BARRIER
MPI_BCAST
MPI_BSEND
MPI_BUFFER_ATTACH
MPI_BUFFER_DETACH
MPI_CART_COORDS
MPI_CART_CREATE
MPI_CART_RANK
MPI_CART_SUB
MPI_COMM_CREATE
MPI_COMM_DUP
MPI_COMM_FREE
MPI_COMM_GROUP
MPI_COMM_RANK
MPI_COMM_SIZE
MPI_COMM_SPLIT
MPI_ERROR_STRING
MPI_FILE_CLOSE
MPI_FILE_IWRITE_SHARED
MPI_FILE_WRITE_ORDERED
MPI_FILE_WRITE_ORDERED_BEGIN
MPI_FILE_WRITE_ORDERED_END
MPI_FILE_WRITE_SHARED
MPI_FINALIZE
MPI_FINALIZED
MPI_GATHER
MPI_GATHERV
MPI_GET_COUNT
MPI_GROUP_FREE
MPI_GROUP_INCL
MPI_IALLGATHERV
MPI_IALLTOALLV
MPI_IBCAST
MPI_IBSEND
MPI_IGATHER
MPI_IGATHERV
MPI_INIT
MPI_INITIALIZED
MPI_INIT_THREAD
MPI_IPROBE
MPI_IRECV
MPI_ISCATTERV
MPI_ISEND
MPI_PROBE
MPI_RECV
MPI_SCATTER
MPI_SCATTERV
MPI_SEND
MPI_SSEND
MPI_TESTSOME
MPI_TYPE_SIZE
MPI_WAIT
MPI_WAITALL
MPI_WAITANY
MPI_WAITSOME
);

@f = map { lc ($_) } @f;

$fh = 'FileHandle'->new (">umpi/umpi_stubs.c");

for (@f)
  {
    $fh->print ("void $_\_ () { umpi_die (\"$_\"); }\n");
  }

@tmp = @f_f;
while (my ($type, $name) = splice (@tmp, 0, 2))
  {
    $name = lc ($name);
    $fh->print ("void $name\_ () { umpi_die (\"$name\"); }\n");
  }

$fh->close ();




