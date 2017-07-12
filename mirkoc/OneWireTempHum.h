#ifndef _ONE_WIRE_TEMP_HUM_H
#define _ONE_WIRE_TEMP_HUM_H

#include "stdint.h"
#include "timer.h"

//DATA PIN NEEDS TO BE CONNECTED ON PB7

uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();
void InitTimerTemp();

float calcTemp();
float calcHumTemp(uint8_t humB);

#endif