#ifndef _TIMER_H
#define _TIMER_H

#include "stdint.h"

void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();


#endif