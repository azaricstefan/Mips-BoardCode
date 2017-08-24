#ifndef _LCD_H
#define _LCD_H

#include "stdint.h"
#include "timer.h"

#define DELAY_LCD   100

void showTempLCD(float temp, float hum);
void initLCD();

void showText(uint8_t* text);

#endif