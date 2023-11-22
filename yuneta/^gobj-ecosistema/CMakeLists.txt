##############################################
#   CMake
##############################################
cmake_minimum_required(VERSION 3.11)

##############################################
#   Source
##############################################
add_subdirectory(ghelpers)
add_subdirectory(timeranger)
add_subdirectory(ytls)
add_subdirectory(ginsfsm)
add_subdirectory(stats)

# compile in Release mode optimized but adding debug symbols, useful for profiling :
#
#     cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
#
# or compile with NO optimization and adding debug symbols :
#
#     cmake -DCMAKE_BUILD_TYPE=Debug ..
#
# Compilando para ARM poner cmake -DNOT_INCLUDE_LIBUNWIND
#
