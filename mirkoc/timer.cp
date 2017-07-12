#line 1 "C:/Users/tasha/Desktop/projPrekidi/timer.c"
#line 1 "c:/users/tasha/desktop/projprekidi/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 6 "c:/users/tasha/desktop/projprekidi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();
#line 3 "C:/Users/tasha/Desktop/projPrekidi/timer.c"
volatile uint32_t tick_us;
volatile uint32_t tick_ms;



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
