
#define MPICH_IGNORE_CXX_SEEK 1
#include <iostream>
#include "parmetis.h"

int main() {
#ifdef PARMETIS_SUBMINOR_VERSION
  std::cout << PARMETIS_MAJOR_VERSION << "."
	    << PARMETIS_MINOR_VERSION << "."
            << PARMETIS_SUBMINOR_VERSION;
#else
  std::cout << PARMETIS_MAJOR_VERSION << "."
	    << PARMETIS_MINOR_VERSION;
#endif
  return 0;
}
