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
#define   _WAIT_FOR_MESURING_x2     100
#define   _WAIT_FOR_MESURING_x4     200
#define   _WAIT_FOR_MESURING_x8     400
#define   _WAIT_FOR_MESURING_x16     750
#define   _DOUBLE_PRECISION	  2
#define   _FOUR__PRECISION	      4   
#define   _EIGHT_PRECISION	      8
#define   _SIXTEEN_PRECISION	 16
#define   _DOUBLE_PRECISION_CODED 0x1F
#define   _FOUR_PRECISION_CODED 0x3F
#define   _EIGHT_PRECISION_CODED 0x5F
#define   _SIXTEEN_PRECISION_CODED 0x7F
#define   _ERROR_TEMP             -100

uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();

float calcTemp();
void setPrecision(uint8_t precision_);

#endif