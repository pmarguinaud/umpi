#include <stdlib.h>
#include <stdio.h>

extern int umpicom_;

void __attribute__((constructor))
umpi_start ()
{
  umpi_initf_ (&umpicom_);
}

void umpi_die (const char * func)
{
  fprintf (stderr, "UMPI: `%s' does not exist\n", func);
  abort ();
}
