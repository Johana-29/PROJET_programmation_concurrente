# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\Interface_projet_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\Interface_projet_autogen.dir\\ParseCache.txt"
  "Interface_projet_autogen"
  )
endif()
