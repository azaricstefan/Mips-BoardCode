#ifndef _TIMER_H
#define _TIMER_H

#include "stdint.h"
#define _RTC_TIME 60

void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);


#endif