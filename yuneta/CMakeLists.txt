##############################################
#   CMake
##############################################
project(yuneta-all C)


##############################################
#   Source
##############################################
add_subdirectory(^gobj-ecosistema)
add_subdirectory(^yuneta)
add_subdirectory(^yunos)

# HACK Comment this subdirectories in case of error cause new api.
# add_subdirectory(^gobj-ecosistema/tests-g)
# add_subdirectory(^yuneta/tests-y)

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
