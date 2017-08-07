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
  NVIC_SetIntPriority(IVT_INT_TIM2, _NVIC_INT_PRIORITY_LVL1);
  TIM2_DIER.UIE = 1;
  tick_us=0;
}

void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  if(tick_us<_MAX_TIME_CALC)
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
  NVIC_SetIntPriority(IVT_INT_TIM3, _NVIC_INT_PRIORITY_LVL1);
  TIM3_DIER.UIE = 1;
}

void Timer3_interrupt() iv IVT_INT_TIM3 {
  TIM3_SR.UIF = 0;
  if(tick_ms<_MAX_TIME_CALC)
    tick_ms++;
}

void my_Delay_ms(uint32_t num)
{
  tick_ms=0;
  while(tick_ms<num);
}

void RTCInit(void) {
  RCC_APB1ENR.PWREN = 1; // Enable RTC clock
  PWR_CR.DBP = 1; // Allow access to RTC
  RTC_WPR = 0xCA; // Unlock write protection
  RTC_WPR = 0x53;
  if (RCC_BDCR.RTCEN==0) { // if RTC is disabled,
    RCC_BDCR = 0x00010000; // Reset the backup domain
    RCC_BDCR = 0x00008101; // Set RTCEN, select LSE, set LSEON
  }
  while (RTC_ISR.RSF!=1) // Wait for RTC APB registers synchronization
    ;
  while (RCC_BDCR.LSERDY!=1) // Wait till LSE is ready
    ;

  EXTI_IMR.MR22 = 1; // Set EXTI22 for wake-up timer
  EXTI_RTSR.TR22 = 1;
  RTC_CR.WUTE = 0; // Stop wake-up timer, to access it
  while (RTC_ISR.WUTWF!=1) // Wait for wake-up timer access
    ;
  RTC_CR.WUTIE = 1; // Enable wake-up timer interrupt
  RTC_WUTR = _RTC_TIME; // Set timer period in seconds
  RTC_CR |= (0x00000004); // Clear WUCKSEL, to select LSE as clock
  RTC_CR.WUTE = 1; // Enable wake-up timer

  RTC_ISR |= 0x00000080; // Enter initialization mode, bit 7
  while (RTC_ISR.INITF!=1) // Confirm status, bit 6
    ;
//  RTC_PRER = 0x7f00ff; // Set SynchPrediv to FF and AsynchPrediv to 7F
//  RTC_PRER = 0x7f00ff; // Write twice, for SyncPre and AsyncPre.
// Set time and date here if needed
//  RTC_CRbits.FMT = 0; // Set FMT 24H format
  RTC_ISR &= ~0x00000080; // Exit initialization mode

  RTC_WPR = 0xFF; // Lock write protect
  PWR_CR.DBP = 0; // Inhibit RTC access
  NVIC_IntEnable(IVT_INT_RTC_WKUP); // Enable RTC wake up interrupt
  NVIC_SetIntPriority(IVT_INT_RTC_WKUP, _NVIC_INT_PRIORITY_LVL2);
}