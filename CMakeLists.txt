# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8)
project(ICU)

include(HunterGate.cmake)
hunter_add_package(Sugar)
include(${SUGAR_ROOT}/cmake/Sugar)

include(sugar_include)

option(ICU_STATIC_LIBRARY "Build ICU static library" ON)

if(ICU_STATIC_LIBRARY)
  set(ICU_TYPE STATIC)
else()
  set(ICU_TYPE SHARED)
endif()

include_directories("source/common")
include_directories("source/i18n")

if(FALSE) # TODO
  if(WIN32)
    add_library(icudata IMPORTED windows/icudt.dll)
  else()
    option(ICU_USE_DATA_FILE_FLAG "TODO" OFF)

    if(ICU_USE_DATA_FILE_FLAG)
      add_library(
          icudata
          ${ICU_TYPE}
          source/stubdata/stubdata.c
      )
    else()
      add_library(icudata ${ICU_TYPE} android/icudt46l_dat.S)
      add_library(icudata ${ICU_TYPE} linux/icudt46l_dat.S)
      add_library(icudata ${ICU_TYPE} mac/icudt46l_dat.S)
      if(APPLE)
        set_target_properties(icudata RESOURCES source/data/in/icudt46l.dat)
      endif()
    endif()
  endif()

  target_compile_definitions(icudata U_HIDE_DATA_SYMBOL)
else()
  add_library(icudata INTERFACE)
endif()

sugar_include("./source/common") # ICU_UC_SOURCES
add_library(icuuc ${ICU_TYPE} ${ICU_UC_SOURCES})
target_compile_definitions(icuuc PUBLIC U_COMMON_IMPLEMENTATION)
target_link_libraries(icuuc icudata)

sugar_include("./source/i18n") # ICU_I18N_SOURCES
add_library(icui18n ${ICU_TYPE} ${ICU_I18N_SOURCES})
target_compile_definitions(icui18n PUBLIC U_I18N_IMPLEMENTATION)
target_link_libraries(icui18n PUBLIC icuuc)

# target_compile_definitions(icudata PUBLIC U_USING_ICU_NAMESPACE=0)
target_compile_definitions(icui18n PUBLIC U_USING_ICU_NAMESPACE=0)
target_compile_definitions(icuuc PUBLIC U_USING_ICU_NAMESPACE=0)

if(ICU_STATIC_LIBRARY)
  # target_compile_definitions(icudata PUBLIC U_STATIC_IMPLEMENTATION)
  target_compile_definitions(icui18n PUBLIC U_STATIC_IMPLEMENTATION)
  target_compile_definitions(icuuc PUBLIC U_STATIC_IMPLEMENTATION)
endif()

# Install config
set(LIB_DEST lib)
set(INCL_DEST include)
set(CONF_DEST lib/cmake/ICU)
