# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.8)
   message(FATAL_ERROR "CMake >= 2.8.0 required")
endif()
if(CMAKE_VERSION VERSION_LESS "2.8.12")
   message(FATAL_ERROR "CMake >= 2.8.12 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.8.12...3.27)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_cmake_targets_defined "")
set(_cmake_targets_not_defined "")
set(_cmake_expected_targets "")
foreach(_cmake_expected_target IN ITEMS hdf5::hdf5-static hdf5::hdf5-shared hdf5::mirror_server hdf5::mirror_server_stop hdf5::hdf5_tools-static hdf5::hdf5_tools-shared hdf5::h5diff hdf5::h5ls hdf5::h5debug hdf5::h5repart hdf5::h5mkgrp hdf5::h5clear hdf5::h5delete hdf5::h5import hdf5::h5repack hdf5::h5jam hdf5::h5unjam hdf5::h5copy hdf5::h5stat hdf5::h5dump hdf5::h5format_convert hdf5::h5perf_serial hdf5::hdf5_hl-static hdf5::hdf5_hl-shared hdf5::h5watch hdf5::hdf5_f90cstub-static hdf5::hdf5_f90cstub-shared hdf5::hdf5_fortran-static hdf5::hdf5_fortran-shared hdf5::hdf5_hl_f90cstub-static hdf5::hdf5_hl_f90cstub-shared hdf5::hdf5_hl_fortran-static hdf5::hdf5_hl_fortran-shared hdf5::hdf5_cpp-static hdf5::hdf5_cpp-shared hdf5::hdf5_hl_cpp-static hdf5::hdf5_hl_cpp-shared hdf5::hdf5_java)
  list(APPEND _cmake_expected_targets "${_cmake_expected_target}")
  if(TARGET "${_cmake_expected_target}")
    list(APPEND _cmake_targets_defined "${_cmake_expected_target}")
  else()
    list(APPEND _cmake_targets_not_defined "${_cmake_expected_target}")
  endif()
endforeach()
unset(_cmake_expected_target)
if(_cmake_targets_defined STREQUAL _cmake_expected_targets)
  unset(_cmake_targets_defined)
  unset(_cmake_targets_not_defined)
  unset(_cmake_expected_targets)
  unset(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT _cmake_targets_defined STREQUAL "")
  string(REPLACE ";" ", " _cmake_targets_defined_text "${_cmake_targets_defined}")
  string(REPLACE ";" ", " _cmake_targets_not_defined_text "${_cmake_targets_not_defined}")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_cmake_targets_defined_text}\nTargets not yet defined: ${_cmake_targets_not_defined_text}\n")
endif()
unset(_cmake_targets_defined)
unset(_cmake_targets_not_defined)
unset(_cmake_expected_targets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target hdf5::hdf5-static
add_library(hdf5::hdf5-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5-static PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "_POSIX_C_SOURCE=200809L;_GNU_SOURCE;_LARGEFILE_SOURCE;_FILE_OFFSET_BITS=64"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:m>;\$<LINK_ONLY:dl>;\$<LINK_ONLY:hdf5::zlib-static>;\$<LINK_ONLY:hdf5::szaec-static>;\$<LINK_ONLY:hdf5::aec-static>;\$<\$<NOT:\$<PLATFORM_ID:Windows>>:dl>;\$<\$<BOOL:OFF>:MPI::MPI_C>;\$<LINK_ONLY:\$<\$<OR:\$<BOOL:OFF>,\$<BOOL:OFF>>:Threads::Threads>>"
)

# Create imported target hdf5::hdf5-shared
add_library(hdf5::hdf5-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB;_POSIX_C_SOURCE=200809L;_GNU_SOURCE;_LARGEFILE_SOURCE;_FILE_OFFSET_BITS=64"
  INTERFACE_INCLUDE_DIRECTORIES "\$<\$<BOOL:OFF>:>;${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<\$<NOT:\$<PLATFORM_ID:Windows>>:dl>;\$<\$<BOOL:OFF>:MPI::MPI_C>"
)

# Create imported target hdf5::mirror_server
add_executable(hdf5::mirror_server IMPORTED)

# Create imported target hdf5::mirror_server_stop
add_executable(hdf5::mirror_server_stop IMPORTED)

# Create imported target hdf5::hdf5_tools-static
add_library(hdf5::hdf5_tools-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_tools-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-static;\$<LINK_ONLY:\$<\$<BOOL:OFF>:MPI::MPI_C>>"
)

# Create imported target hdf5::hdf5_tools-shared
add_library(hdf5::hdf5_tools-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_tools-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-shared"
)

# Create imported target hdf5::h5diff
add_executable(hdf5::h5diff IMPORTED)

# Create imported target hdf5::h5ls
add_executable(hdf5::h5ls IMPORTED)

# Create imported target hdf5::h5debug
add_executable(hdf5::h5debug IMPORTED)

# Create imported target hdf5::h5repart
add_executable(hdf5::h5repart IMPORTED)

# Create imported target hdf5::h5mkgrp
add_executable(hdf5::h5mkgrp IMPORTED)

# Create imported target hdf5::h5clear
add_executable(hdf5::h5clear IMPORTED)

# Create imported target hdf5::h5delete
add_executable(hdf5::h5delete IMPORTED)

# Create imported target hdf5::h5import
add_executable(hdf5::h5import IMPORTED)

# Create imported target hdf5::h5repack
add_executable(hdf5::h5repack IMPORTED)

# Create imported target hdf5::h5jam
add_executable(hdf5::h5jam IMPORTED)

# Create imported target hdf5::h5unjam
add_executable(hdf5::h5unjam IMPORTED)

# Create imported target hdf5::h5copy
add_executable(hdf5::h5copy IMPORTED)

# Create imported target hdf5::h5stat
add_executable(hdf5::h5stat IMPORTED)

# Create imported target hdf5::h5dump
add_executable(hdf5::h5dump IMPORTED)

# Create imported target hdf5::h5format_convert
add_executable(hdf5::h5format_convert IMPORTED)

# Create imported target hdf5::h5perf_serial
add_executable(hdf5::h5perf_serial IMPORTED)

# Create imported target hdf5::hdf5_hl-static
add_library(hdf5::hdf5_hl-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_hl-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-static"
)

# Create imported target hdf5::hdf5_hl-shared
add_library(hdf5::hdf5_hl-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_hl-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-shared"
)

# Create imported target hdf5::h5watch
add_executable(hdf5::h5watch IMPORTED)

# Create imported target hdf5::hdf5_f90cstub-static
add_library(hdf5::hdf5_f90cstub-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_f90cstub-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-static"
)

# Create imported target hdf5::hdf5_f90cstub-shared
add_library(hdf5::hdf5_f90cstub-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_f90cstub-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-shared"
)

# Create imported target hdf5::hdf5_fortran-static
add_library(hdf5::hdf5_fortran-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_fortran-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/mod/static;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_f90cstub-static;\$<LINK_ONLY:m>;\$<LINK_ONLY:dl>;\$<LINK_ONLY:\$<\$<BOOL:OFF>:>>"
)

# Create imported target hdf5::hdf5_fortran-shared
add_library(hdf5::hdf5_fortran-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_fortran-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/mod/shared;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_f90cstub-shared"
)

# Create imported target hdf5::hdf5_hl_f90cstub-static
add_library(hdf5::hdf5_hl_f90cstub-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_hl_f90cstub-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_f90cstub-static;hdf5::hdf5_hl-static"
)

# Create imported target hdf5::hdf5_hl_f90cstub-shared
add_library(hdf5::hdf5_hl_f90cstub-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_hl_f90cstub-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_f90cstub-shared;hdf5::hdf5_hl-shared"
)

# Create imported target hdf5::hdf5_hl_fortran-static
add_library(hdf5::hdf5_hl_fortran-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_hl_fortran-static PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "\$<\$<STREQUAL:x,xMSVC>:HDF5F90_WINDOWS>"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/mod/static;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_hl_f90cstub-static;hdf5::hdf5_fortran-static"
)

# Create imported target hdf5::hdf5_hl_fortran-shared
add_library(hdf5::hdf5_hl_fortran-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_hl_fortran-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/mod/shared;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_hl_f90cstub-shared;hdf5::hdf5_fortran-shared"
)

# Create imported target hdf5::hdf5_cpp-static
add_library(hdf5::hdf5_cpp-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_cpp-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-static"
)

# Create imported target hdf5::hdf5_cpp-shared
add_library(hdf5::hdf5_cpp-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_cpp-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-shared"
)

# Create imported target hdf5::hdf5_hl_cpp-static
add_library(hdf5::hdf5_hl_cpp-static STATIC IMPORTED)

set_target_properties(hdf5::hdf5_hl_cpp-static PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_hl-static;hdf5::hdf5-static"
)

# Create imported target hdf5::hdf5_hl_cpp-shared
add_library(hdf5::hdf5_hl_cpp-shared SHARED IMPORTED)

set_target_properties(hdf5::hdf5_hl_cpp-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5_hl-shared;hdf5::hdf5-shared"
)

# Create imported target hdf5::hdf5_java
add_library(hdf5::hdf5_java SHARED IMPORTED)

set_target_properties(hdf5::hdf5_java PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5::hdf5-shared"
)

# Load information for each installed configuration.
file(GLOB _cmake_config_files "${CMAKE_CURRENT_LIST_DIR}/hdf5-targets-*.cmake")
foreach(_cmake_config_file IN LISTS _cmake_config_files)
  include("${_cmake_config_file}")
endforeach()
unset(_cmake_config_file)
unset(_cmake_config_files)

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(_cmake_target IN LISTS _cmake_import_check_targets)
  if(CMAKE_VERSION VERSION_LESS "3.28"
      OR NOT DEFINED _cmake_import_check_xcframework_for_${_cmake_target}
      OR NOT IS_DIRECTORY "${_cmake_import_check_xcframework_for_${_cmake_target}}")
    foreach(_cmake_file IN LISTS "_cmake_import_check_files_for_${_cmake_target}")
      if(NOT EXISTS "${_cmake_file}")
        message(FATAL_ERROR "The imported target \"${_cmake_target}\" references the file
   \"${_cmake_file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
      endif()
    endforeach()
  endif()
  unset(_cmake_file)
  unset("_cmake_import_check_files_for_${_cmake_target}")
endforeach()
unset(_cmake_target)
unset(_cmake_import_check_targets)

# Make sure the targets which have been exported in some other
# export set exist.
unset(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets)
foreach(_target "hdf5::zlib-static" "hdf5::szaec-static" "hdf5::aec-static" )
  if(NOT TARGET "${_target}" )
    set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets "${${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets} ${_target}")
  endif()
endforeach()

if(DEFINED ${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets)
  if(CMAKE_FIND_PACKAGE_NAME)
    set( ${CMAKE_FIND_PACKAGE_NAME}_FOUND FALSE)
    set( ${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE "The following imported targets are referenced, but are missing: ${${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets}")
  else()
    message(FATAL_ERROR "The following imported targets are referenced, but are missing: ${${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets}")
  endif()
endif()
unset(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE_targets)

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)