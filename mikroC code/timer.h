#ifndef _TIMER_H
#define _TIMER_H

#include "stdint.h"
#define _RTC_TIME       120
#define _MAX_TIME_CALC  1000000000

void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);


#endif