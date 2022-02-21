# Compiler's safety flags GNU compiler.
# Based on:
#  https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
#  https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html
#  https://developers.redhat.com/blog/2018/03/21/compiler-and-linker-flags-gcc

list(APPEND SAFETY_FLAGS
  -Wall
  -Wextra
  -Wshadow
  -Winit-self
  -Wuninitialized
  -Wundef
  -Wswitch-enum
  -Wdouble-promotion
  -Wformat=2
  -Wformat-security
  -Wconversion
  -Wsign-conversion
  -Wold-style-cast
  -Wunreachable-code
  -Werror
  -Wpedantic
  -Wno-unused-value
  -Wno-unused-result
  -Wno-unused-function
  -Wno-unused-parameter
)

list(APPEND SAFETY_FLAGS
  -fno-lto
  -march=native
  -D_FORTIFY_SOURCE=2
)

if(QT_FOUND)
  list(APPEND SAFETY_FLAGS
    -Wno-padded
  )
endif()

list(APPEND SAFETY_FLAGS
  -Wformat-overflow
  -Wformat-truncation
  -Wl,-z,defs
  -Wl,-z,now
  -Wl,-z,relro
  -fstack-clash-protection
)

if(NOT WIN32)
  list(APPEND SAFETY_FLAGS
    -O2
    -fstack-protector-all
    -fstack-protector-strong
    -fno-short-enums
    -fno-fast-math
    -fno-common
    -fexceptions
    -fverbose-asm
    -fasynchronous-unwind-tables
    -pipe
  )
endif()
