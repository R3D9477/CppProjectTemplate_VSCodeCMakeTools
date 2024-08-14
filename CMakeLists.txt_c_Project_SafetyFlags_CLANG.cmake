# Safety flags for Clang.
# Some of the safety flags may request certain optimization level.

# Based on:
#  https://interrupt.memfault.com/blog/best-and-worst-gcc-clang-compiler-flags#-weverything-clang-only

list(APPEND SAFETY_FLAGS
  -Wall
  -Wextra
  -Wshadow
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
  -Winfinite-recursion
  -Wnonnull # works with -Og
  -Wnull-dereference # works with -O1
)

if(QT_FOUND)
  list(APPEND SAFETY_FLAGS
    -Wno-padded
  )
endif()

list(APPEND SAFETY_FLAGS
  -ffunction-sections
  -fdata-sections
)

list(APPEND SAFETY_FLAGS
  -Wno-implicit-float-conversion
  -Wno-double-promotion
)
