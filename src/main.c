#include "stm32f4xx.h"
#include "stm32f446xx.h"

#define PA5_OUTPUT  (1 << 10)
#define LED_PIN     (1 << 5)

int main(){

    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
    GPIOA->MODER |= PA5_OUTPUT;

    while(1){

        GPIOA->ODR ^= LED_PIN;

        for(volatile uint32_t i=0; i<100000; i++);
    }

}