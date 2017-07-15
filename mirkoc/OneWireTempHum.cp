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
float calcHumTemp(uint8_t humB);
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

float calcHumTemp(uint8_t humB){
 uint32_t result = 1, i = 0;
 uint8_t array[5];
 float res=0;
 for(i;i<5;i++)
 array[i] = 0;

 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
 HUM_OUT = 1;
 HUM_OUT = 0;
 my_Delay_ms(18);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
 my_Delay_us(70);
 result = HUM_IN;
 my_Delay_us(130);

 i=0;
 for(i;i<40;i++){
 while(HUM_IN == 0);
 my_Delay_us(50);
 if(HUM_IN == 0)
 array[i/8] |= HUM_IN<<(7-i%8);
 else
 {
 array[i/8] |= HUM_IN<<(7-i%8);
 my_Delay_us(50);
 }
 }

 if(humB==0)
 {
 res=array[2]&0x7F;
 res=res*25.6+array[3]*0.1;
 if(array[2]&0x80)
 res=-res;
 }
 else
 {
 res=array[0]&0x7F;
 res=res*25.6+array[1]*0.1;
 if(array[0]&0x80)
 res=-res;
 }
 return res;
}
