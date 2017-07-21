#ifndef _TEMPERATURE_H
#define _TEMPERATURE_H

#include "stdint.h"
#include "timer.h"

//DATA PIN NEEDS TO BE CONNECTED ON PB1

#define   _TEMP_RESET_START       480
#define   _TEMP_RESET_1           70
#define   _TEMP_RESET_2           250
#define   _TEMP_READ_ONE_1        15
#define   _TEMP_READ_ONE_2        50
#define   _TEMP_READ_ZERO         65
#define   _TEMP_READ_INIT         5
#define   _TEMP_READ_WAIT         55
#define   _WAIT_FOR_INIT_TIME     750
#define   _ERROR_TEMP             -100

uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();

float calcTemp();

#endif