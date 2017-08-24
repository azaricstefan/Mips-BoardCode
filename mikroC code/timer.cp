#line 1 "C:/Code/MMT koji ne radi/timer.c"
#line 1 "c:/code/mmt koji ne radi/timer.h"
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
#line 9 "c:/code/mmt koji ne radi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);
#line 3 "C:/Code/MMT koji ne radi/timer.c"
volatile uint32_t tick_us;
volatile uint32_t tick_ms;



void InitTimerUs(){
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 0;
 TIM2_ARR = 59;
 NVIC_IntEnable(IVT_INT_TIM2);
 NVIC_SetIntPriority(IVT_INT_TIM2, _NVIC_INT_PRIORITY_LVL1);
 TIM2_DIER.UIE = 1;
 tick_us=0;
}

void Timer2_interrupt() iv IVT_INT_TIM2 {
 TIM2_SR.UIF = 0;
 if(tick_us< 1000000000 )
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
 NVIC_SetIntPriority(IVT_INT_TIM3, _NVIC_INT_PRIORITY_LVL1);
 TIM3_DIER.UIE = 1;
}

void Timer3_interrupt() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;
 if(tick_ms< 1000000000 )
 tick_ms++;
}

void my_Delay_ms(uint32_t num)
{
 tick_ms=0;
 while(tick_ms<num);
}

void RTCInit(void) {
 RCC_APB1ENR.PWREN = 1;
 PWR_CR.DBP = 1;
 RTC_WPR = 0xCA;
 RTC_WPR = 0x53;
 if (RCC_BDCR.RTCEN==0) {
 RCC_BDCR = 0x00010000;
 RCC_BDCR = 0x00008101;
 }
 while (RTC_ISR.RSF!=1)
 ;
 while (RCC_BDCR.LSERDY!=1)
 ;

 EXTI_IMR.MR22 = 1;
 EXTI_RTSR.TR22 = 1;
 RTC_CR.WUTE = 0;
 while (RTC_ISR.WUTWF!=1)
 ;
 RTC_CR.WUTIE = 1;
 RTC_WUTR =  20 ;
 RTC_CR |= (0x00000004);
 RTC_CR.WUTE = 1;

 RTC_ISR |= 0x00000080;
 while (RTC_ISR.INITF!=1)
 ;




 RTC_ISR &= ~0x00000080;

 RTC_WPR = 0xFF;
 PWR_CR.DBP = 0;
 NVIC_IntEnable(IVT_INT_RTC_WKUP);
 NVIC_SetIntPriority(IVT_INT_RTC_WKUP, _NVIC_INT_PRIORITY_LVL2);
}
