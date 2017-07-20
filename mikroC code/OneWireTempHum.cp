#line 1 "C:/Code/Tamara latest/OneWireTempHUm.c"
#line 1 "c:/code/tamara latest/onewiretemphum.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/code/tamara latest/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 6 "c:/code/tamara latest/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);
#line 9 "c:/code/tamara latest/onewiretemphum.h"
uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();
void InitTimerTemp();

float calcTemp();
#line 3 "C:/Code/Tamara latest/OneWireTempHUm.c"
sbit OWDI at IDR7_GPIOB_IDR_bit;
sbit OWDO at ODR7_GPIOB_ODR_bit;

sbit HUM_OUT at ODR7_GPIOC_ODR_bit;
sbit HUM_IN at IDR7_GPIOC_IDR_bit;


uint8_t oneWireReset(){
 uint8_t ret;

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;
 my_Delay_us(480);
 OWDO = 1;
 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);

 my_Delay_us(70);
 ret = OWDI;
 if (ret == 0){
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 }
 my_Delay_us(250);

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 return ret;
}

void oneWireWriteBit(uint8_t b){
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;
 if (b){
 my_Delay_us(15);
 OWDO = 1;
 my_Delay_us(50);
 } else{
 my_Delay_us(65);
 OWDO = 1;
 }
}

int oneWireReadBit(){
 uint8_t b;
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;

 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
 my_Delay_us(5);
 b = OWDI;
 my_Delay_us(55);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 return b;
}

void oneWireWrite(unsigned short byte){
 uint8_t i, b;
 for (i = 0; i < 8; i++){
 b = byte & 0x01;
 oneWireWriteBit(b);
 byte >>=1;
 }
}

unsigned short oneWireRead(){
 uint8_t byte, b, i;
 byte = 0;
 for (i = 0; i < 8; i++){
 b = oneWireReadBit();
 b <<= i;
 byte |= b;
 }
 return byte;
}

float calcTemp()
{
 float tempF;
 int32_t temp;
 uint8_t test;

 temp = 0;
 test = oneWireReset();
 oneWireWrite(0xCC);
 oneWireWrite(0x44);
 my_Delay_ms(750);
 test = oneWireReset();
 oneWireWrite(0xCC);
 oneWireWrite(0xBE);

 temp=oneWireRead();
 temp=temp+(oneWireRead()<<8);
 if(temp & 0xF000)
 {
 temp=(~temp)&0x0000FFFF;
 temp=temp+1;
 temp=-temp;
 }
 tempF=temp*1.0/16.0;
 return tempF;
}
