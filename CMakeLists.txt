cmake_minimum_required(VERSION 3.0)

# Use arm-none-eabi toolchain
include(cmake/ARM_toolchain.cmake)

# Fix the CMAKE issue "... is not able to compile a simple test program."
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

# Set the project name
project(blink VERSION 1.0.0 LANGUAGES ASM C CXX)

# MCU parameters
set(MCU_ARCH    "cortex-m4")
set(STM32_MCU   "STM32F446xx")

# Linker directory
set(LINKER      "${CMAKE_CURRENT_SOURCE_DIR}/STM32F446RE/linker/STM32F446RETX_FLASH.ld")

# CMSIS directory
set(CMSIS_DIR   "${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Include")

# Sources
set(SOURCES 
    src/main.cpp
)

# This prevents linker from "-rdynamic" error.
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS   "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
set(CMAKE_EXE_LINKER_FLAGS "-T${LINKER}")

set(CMAKE_C_FLAGS  "-mcpu=${MCU_ARCH}   \
                    -D${STM32_MCU}      \
                    -mthumb             \
                    -mfloat-abi=hard    \
                    -mfpu=fpv4-sp-d16   \
                    --specs=nosys.specs \
                    -O3")

set(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")

# Link STM32F446RE startup code with rest of the code.
add_subdirectory(STM32F446RE)
add_executable(${PROJECT_NAME}.elf ${SOURCES})
target_link_libraries(${PROJECT_NAME}.elf PRIVATE STM32F446)

# Compile the bin file to upload.
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${PROJECT_NAME}.elf> ${CMAKE_CURRENT_SOURCE_DIR}/bin/${PROJECT_NAME}.bin
)