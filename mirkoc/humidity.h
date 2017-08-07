#ifndef _HUMIDITY_H
#define _HUMIDITY_H

#include "stdint.h"
#include "timer.h"

#define   _INIT_TIME_SET          18
#define   _INIT_TIME_WAIT_1       70
#define   _INIT_TIME_WAIT_2       130
#define   _TIME_HUM_READ          50
#define   _ERROR_HUM              -100

//DATA PIN NEEDS TO BE CONNECTED ON PC1 

float calcHumTemp(uint8_t humB);

#endif