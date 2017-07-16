#ifndef _TEMPERATURE_H
#define _TEMPERATURE_H

#include "stdint.h"
#include "timer.h"

//DATA PIN NEEDS TO BE CONNECTED ON PB7


uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();
void InitTimerTemp();

float calcTemp();

#endif