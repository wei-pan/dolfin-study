set(PACKAGE_VERSION "2019.2.0.dev0")
set(PACKAGE_VERSION_MAJOR "2019")
set(PACKAGE_VERSION_MINOR "2")
set(PACKAGE_VERSION_PATCH "0")

# FIXME: When should versions be defined as compatible?
# This version is compatible only with matching major.minor versions.
if ("${PACKAGE_VERSION_MAJOR}.${PACKAGE_VERSION_MINOR}" VERSION_EQUAL "${PACKAGE_FIND_VERSION_MAJOR}.${PACKAGE_FIND_VERSION_MINOR}")
  # This version is compatible with equal or lesser patch versions.
  if (NOT "${PACKAGE_VERSION_PATCH}" VERSION_LESS "${PACKAGE_FIND_VERSION_PATCH}")
    set(PACKAGE_VERSION_COMPATIBLE 1)
    if ("${PACKAGE_VERSION_PATCH}" VERSION_EQUAL "${PACKAGE_FIND_VERSION_PATCH}")
      set(PACKAGE_VERSION_EXACT 1)
    endif()
  endif()
endif()
