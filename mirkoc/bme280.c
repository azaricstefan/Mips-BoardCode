#include "bme280.h"

uint16_t dig_T1;
int16_t dig_T2;
int16_t dig_T3;

uint16_t dig_P1;
int16_t dig_P2;
int16_t dig_P3;
int16_t dig_P4;
int16_t dig_P5;
int16_t dig_P6;
int16_t dig_P7;
int16_t dig_P8;
int16_t dig_P9;

int32_t t_fine;

sbit LD11 at ODR12_GPIOE_ODR_bit;
sbit LD22 at ODR15_GPIOE_ODR_bit;

uint8_t  data_[10], conv[20];
uint8_t  output[10];

void BME_Write( int len) {
    I2C3_Start();
    I2C3_Write(BME280_ADDRESS, data_, len, END_MODE_STOP);
}

void BME_Read( uint32_t len, uint32_t readlen) {
      LD11=1; LD22=0;
    I2C3_Start();
        LD11=1; LD22=1;
    I2C3_Write(BME280_ADDRESS, data_, len, END_MODE_RESTART);
    LD11=0; LD22=1;
    I2C3_Read(BME280_ADDRESS, output, readlen, END_MODE_STOP);
}

int16_t BME_Read_DigS(uint8_t reg) {
    int16_t result;
    data_[0] = reg;
    I2C3_Start();
    I2C3_Write(BME280_ADDRESS, data_, 1, END_MODE_RESTART);
    I2C3_Read(BME280_ADDRESS, output, 2, END_MODE_STOP);
    result = output[1];
    result <<= 8;
    result |= output[0];
    return result;
}

uint16_t BME_Read_DigU(uint8_t reg) {
    uint16_t result;
    data_[0] = reg;
    I2C3_Start();
    I2C3_Write(BME280_ADDRESS, data_, 1, END_MODE_RESTART);
    I2C3_Read(BME280_ADDRESS, output, 2, END_MODE_STOP);
    result = output[1];
    result <<= 8;
    result |= output[0];
    return result;
}



void BME280_Init() {
    
    I2C3_Init_Advanced(100000, &_GPIO_MODULE_I2C3_PA8_PC9);
    NVIC_SetIntPriority(IVT_INT_I2C3_EV, _NVIC_INT_PRIORITY_LVL0);
    NVIC_SetIntPriority(IVT_INT_I2C3_ER, _NVIC_INT_PRIORITY_LVL0);
    // I2C_Set_Active(&I2C_Start, &I2C1_Read, &I2C1_Write);

    // dig init
    dig_T1 = BME_Read_DigU(BME280_REG_DIG_T1);
    dig_T2 = BME_Read_DigS(BME280_REG_DIG_T2);
    dig_T3 = BME_Read_DigS(BME280_REG_DIG_T3);

    dig_P1 = BME_Read_DigU(BME280_REG_DIG_P1);
    dig_P2 = BME_Read_DigS(BME280_REG_DIG_P2);
    dig_P3 = BME_Read_DigS(BME280_REG_DIG_P3);
    dig_P4 = BME_Read_DigS(BME280_REG_DIG_P4);
    dig_P5 = BME_Read_DigS(BME280_REG_DIG_P5);
    dig_P6 = BME_Read_DigS(BME280_REG_DIG_P6);
    dig_P7 = BME_Read_DigS(BME280_REG_DIG_P7);
    dig_P8 = BME_Read_DigS(BME280_REG_DIG_P8);
    dig_P9 = BME_Read_DigS(BME280_REG_DIG_P9);

    data_[0] = BME280_REG_CONTROL;
    data_[1] = BME280_REG_PRESSIRE_CONFIG_DATA;
    BME_Write(2);
}

int32_t BME280_compensate_T_int32(int32_t adc_T) {
    int32_t var1, var2, T;
    long out;
    adc_T >>= 4;
    var1 = ((((adc_T>>3) - ((int32_t)dig_T1<<1))) * ((int32_t)dig_T2)) >> 11;
    var2 = (((((adc_T>>4) - ((int32_t)dig_T1)) * ((adc_T>>4) - ((int32_t)dig_T1))) >> 12) *
    ((int32_t)dig_T3)) >> 14;
    t_fine = var1 + var2;
    T = (t_fine * 5 + 128) >> 8;
    return T;
}

double getTemperature() {

    int32_t result;

    data_[0] = BME280_REG_TEMPDATA;
    
    BME_Read( 1,3);
    
    result = output[0];
    result <<= 8;
    result |= output[1];
    result <<= 8;
    result |= output[2];
    return BME280_compensate_T_int32(result)/100.0;
}

void BME280_Forced_Mode() {
        // after one measurement sensor automatically returns into sleep mode
        uint8_t dataReady = 1;
        data_[0] = BME280_REG_CONTROL;
        data_[1] = BME280_REG_FORCED_MODE;
        //LD11=1; LD22=1;
        BME_Write(2);
        //LD11=0; LD22=1;
        // wait untill measuring starts
        while(dataReady != 0) {
                data_[0] = BME280_REG_STATUS;
                BME_Read( 1, 1);
                dataReady = output[0] & BME280_REG_STATUS_MEASURING_DATA_BIT;
        }
       //  LD11=1; LD22=0;
        // wait untill measuring ends
        while (dataReady == 0) {
                data_[0] = BME280_REG_STATUS;
                BME_Read(1,1);
                dataReady = output[0] & BME280_REG_STATUS_MEASURING_DATA_BIT;
        }
}

uint32_t BME280_compensate_P_int32(int32_t adc_P)
{
    int32_t var1, var2;
    uint32_t p;
    adc_P >>= 4;
    var1 = (((int32_t)t_fine)>>1) - (int32_t)64000;
    var2 = (((var1>>2) * (var1>>2)) >> 11 ) * ((int32_t)dig_P6);
    var2 = var2 + ((var1*((int32_t)dig_P5))<<1);
    var2 = (var2>>2)+(((int32_t)dig_P4)<<16);
    var1 = (((dig_P3 * (((var1>>2) * (var1>>2)) >> 13 )) >> 3) + ((((int32_t)dig_P2) * var1)>>1))>>18;
    var1 =((((32768+var1))*((int32_t)dig_P1))>>15);
    if (var1 == 0) {
        return 0; // avoid exception caused by division by zero
    }
    p = (((uint32_t)(((int32_t)1048576)-adc_P)-(var2>>12)))*3125;
    if (p < 0x80000000) {
        p = (p << 1) / ((uint32_t)var1);
    }
    else {
        p = (p / (uint32_t)var1) * 2;
    }
    var1 = (((int32_t)dig_P9) * ((int32_t)(((p>>3) * (p>>3))>>13)))>>12;
    var2 = (((int32_t)(p>>2)) * ((int32_t)dig_P8))>>13;
    p = (uint32_t)((int32_t)p + ((var1 + var2 + dig_P7) >> 4));
    return p;
}


double getPressure() {
    int32_t result;
    double ret;

    // gets t_fine
    getTemperature();

    data_[0] = BME280_REG_PRESSUREDATA;
    BME_Read( 1, 3);
    result = output[0];
    result <<= 8;
    result |= output[1];
    result <<= 8;
    result |= output[2];
    return BME280_compensate_P_int32(result)/100.0;
}