SUBROUTINE UMPI_INITF (KMPI)

INTEGER :: KMPI (*)

! This is the *real* mpif.h, not the one from umpi !
#include "mpif.h"

KMPI (  1) = MPI_SUCCESS                   
KMPI (  2) = MPI_MAX                       
KMPI (  3) = MPI_MIN                       
KMPI (  4) = MPI_SUM                       
KMPI (  5) = MPI_BXOR                      
KMPI (  6) = MPI_CHARACTER                 
KMPI (  7) = MPI_INTEGER                   
KMPI (  8) = MPI_INTEGER8                  
KMPI (  9) = MPI_LOGICAL                   
KMPI ( 10) = MPI_BYTE                      
KMPI ( 11) = MPI_REAL8                     
KMPI ( 12) = MPI_REAL4                     
KMPI ( 13) = MPI_COMM_WORLD                
KMPI ( 14) = MPI_COMM_NULL                 
KMPI ( 15) = MPI_STATUS_SIZE               
KMPI ( 16) = MPI_MAX_ERROR_STRING          
KMPI ( 17) = MPI_TAG                       
KMPI ( 18) = MPI_ANY_TAG                   
KMPI ( 19) = MPI_SOURCE                    
KMPI ( 20) = MPI_ANY_SOURCE                
KMPI ( 21) = MPI_UNDEFINED                 
KMPI ( 22) = MPI_THREAD_MULTIPLE           
KMPI ( 23) = MPI_THREAD_SINGLE             
KMPI ( 24) = MPI_MODE_RDONLY               
KMPI ( 25) = MPI_MODE_WRONLY               
KMPI ( 26) = MPI_MODE_CREATE               
KMPI ( 27) = MPI_INFO_NULL                 
KMPI ( 28) = MPI_INTEGER4                  
KMPI ( 29) = MPI_DOUBLE_PRECISION          
KMPI ( 30) = MPI_2DOUBLE_PRECISION         
KMPI ( 31) = MPI_MINLOC                    
KMPI ( 32) = MPI_MAXLOC                    
KMPI ( 33) = MPI_REQUEST_NULL              

END SUBROUTINE UMPI_INITF

SUBROUTINE UMPI_UMPIC

! Force COMMON load

#include "umpif.h"

END SUBROUTINE
