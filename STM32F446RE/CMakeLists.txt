add_library(STM32F446 OBJECT 
    startup/startup_stm32f446xx.s
    system/system_stm32f4xx.c
)

target_include_directories(STM32F446 PUBLIC 
    system
    include
    ${CMSIS_DIR}
)