
#define MPICH_IGNORE_CXX_SEEK 1
#include <stdint.h>
#include <stdio.h>
#include <mpi.h>
#include <ptscotch.h>
#include <iostream>

int main() {
  std::cout << SCOTCH_VERSION << "."
	    << SCOTCH_RELEASE << "."
	    << SCOTCH_PATCHLEVEL;
  return 0;
}
