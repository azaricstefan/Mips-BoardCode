#ifndef _BME280_H_
#define _BME280_H_

#include "stdint.h"

//DATA PIN NEEDS TO BE CONNECTED ON I2C2

#define BME280_ADDRESS                  0x76

#define BME280_REG_DIG_T1               0x88
#define BME280_REG_DIG_T2               0x8A
#define BME280_REG_DIG_T3               0x8C

#define BME280_REG_DIG_P1               0x8E
#define BME280_REG_DIG_P2               0x90
#define BME280_REG_DIG_P3               0x92
#define BME280_REG_DIG_P4               0x94
#define BME280_REG_DIG_P5               0x96
#define BME280_REG_DIG_P6               0x98
#define BME280_REG_DIG_P7               0x9A
#define BME280_REG_DIG_P8               0x9C
#define BME280_REG_DIG_P9               0x9E

#define BME280_REG_CHIPID               0xD0
#define BME280_REG_VERSION              0xD1
#define BME280_REG_SOFTRESET            0xE0

#define BME280_REG_CAL26                0xE1

#define BME280_REG_STATUS               0xF3
#define BME280_REG_CONTROL              0xF4
#define BME280_REG_CONFIG               0xF5
#define BME280_REG_PRESSUREDATA         0xF7
#define BME280_REG_TEMPDATA             0xFA

#define BME280_REG_PRESSIRE_CONFIG_DATA 0xB7 // 0xB4 -- sleep mode , 0xB7 -- normal mode
#define BME280_REG_FORCED_MODE          0xB5
#define BME280_REG_STATUS_MEASURING_DATA_BIT  0x08

void BME280_Init();
double getPressure();
double getTemperature(); 

#endif