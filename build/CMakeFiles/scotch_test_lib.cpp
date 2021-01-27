
#define MPICH_IGNORE_CXX_SEEK 1
#include <stdint.h>
#include <stdio.h>
#include <mpi.h>
#include <ptscotch.h>
#include <iostream>
#include <cstdlib>

int main() {
  int provided;
  SCOTCH_Dgraph dgrafdat;

  MPI_Init_thread(0, 0, MPI_THREAD_MULTIPLE, &provided);

  if (SCOTCH_dgraphInit(&dgrafdat, MPI_COMM_WORLD) != 0) {
    if (MPI_THREAD_MULTIPLE > provided) {
      std::cout << "MPI implementation is not thread-safe:" << std::endl;
      std::cout << "SCOTCH should be compiled without SCOTCH_PTHREAD" << std::endl;
      exit(1);
    }
    else {
      std::cout << "libptscotch linked to libscotch or other unknown error" << std::endl;
      exit(2);
    }
  }
  else {
    SCOTCH_dgraphExit(&dgrafdat);
  }

  MPI_Finalize();

  return 0;
}
