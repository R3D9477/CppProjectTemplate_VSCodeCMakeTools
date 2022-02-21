# Safety flags for Clang.
# Based on:
#  https://interrupt.memfault.com/blog/best-and-worst-gcc-clang-compiler-flags#-weverything-clang-only

list(APPEND SAFETY_FLAGS
  -O2
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

if(QT_FOUND)
  list(APPEND SAFETY_FLAGS
    -Wno-padded
  )
endif()

list(APPEND SAFETY_FLAGS
  -ffunction-sections
  -fdata-sections
)

