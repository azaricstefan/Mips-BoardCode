#include "timer.h"

volatile uint32_t tick_us;
volatile uint32_t tick_ms;
//Timer2 Prescaler :0; Preload = 59; Actual Interrupt Time = 1 us

//Place/Copy this part in declaration section
void InitTimerUs(){
  RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 0;
  TIM2_ARR = 59;
  NVIC_IntEnable(IVT_INT_TIM2);
  TIM2_DIER.UIE = 1;
  TIM2_CR1.CEN = 1;
  tick_us=0;
}

void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  if(tick_us<1000000000)
    tick_us++;
}

void my_Delay_us(uint32_t num)
{
  tick_us=0;
  while(tick_us<num);
}

//Timer3 Prescaler :0; Preload = 59999; Actual Interrupt Time = 1 ms
//Place/Copy this part in declaration section
void InitTimerMs(){
  RCC_APB1ENR.TIM3EN = 1;
  TIM3_CR1.CEN = 0;
  TIM3_PSC = 0;
  TIM3_ARR = 59999;
  NVIC_IntEnable(IVT_INT_TIM3);
  TIM3_DIER.UIE = 1;
  TIM3_CR1.CEN = 1;
}

void Timer3_interrupt() iv IVT_INT_TIM3 {
  TIM3_SR.UIF = 0;
  if(tick_ms<1000000000)
    tick_ms++;
}

void my_Delay_ms(uint32_t num)
{
  tick_ms=0;
  while(tick_ms<num);
}