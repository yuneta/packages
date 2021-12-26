##############################################
#   CMake
##############################################
cmake_minimum_required(VERSION 2.8)

##############################################
#   Source
##############################################
add_subdirectory(c-core)
add_subdirectory(c-rc_sqlite)
add_subdirectory(c-tls)
add_subdirectory(c-postgres)
add_subdirectory(c-iot)
add_subdirectory(ybatch)
add_subdirectory(ycommand)
add_subdirectory(ylist)
add_subdirectory(yshutdown)
add_subdirectory(ystats)
add_subdirectory(ytestconfig)
add_subdirectory(yuno-skeleton)
add_subdirectory(yuno_agent)
add_subdirectory(yuno_cli)
add_subdirectory(ygclass-rename)
# add_subdirectory(yuno_master)
add_subdirectory(tests-y)
add_subdirectory(yscapec)
add_subdirectory(ytests)


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
