#line 1 "C:/Users/tasha/Desktop/projPrekidi/main.c"
#line 1 "c:/users/tasha/desktop/projprekidi/onewiretemphum.h"
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
#line 1 "c:/users/tasha/desktop/projprekidi/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 6 "c:/users/tasha/desktop/projprekidi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();
#line 9 "c:/users/tasha/desktop/projprekidi/onewiretemphum.h"
uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();
void InitTimerTemp();

float calcTemp();
float calcHumTemp(uint8_t humB);
#line 1 "c:/users/tasha/desktop/projprekidi/lcd.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/tasha/desktop/projprekidi/timer.h"
#line 7 "c:/users/tasha/desktop/projprekidi/lcd.h"
void showTempLCD(float temp, float hum);
void initLCD();
#line 1 "c:/users/tasha/desktop/projprekidi/uart.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/tasha/desktop/projprekidi/timer.h"
#line 36 "c:/users/tasha/desktop/projprekidi/uart.h"
typedef struct StructUART {
 uint8_t flag;
 uint16_t byteCount;
 uint16_t bufferPointer;
 uint8_t buffer[1600];
} StructUART;


extern volatile StructUART transmitUART, receiveUART;

void USART2_Send_Text(uint8_t* input);
void USART2_Init();
void sendData(float temp, float hum);
#line 5 "C:/Users/tasha/Desktop/projPrekidi/main.c"
sbit LD1 at ODR12_GPIOE_ODR_bit;
sbit LD2 at ODR15_GPIOE_ODR_bit;

float temp, hum;


void initProg()
{
 InitTimerUs();
 InitTimerMs();
 initLCD();

 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
}

void main() {
 initProg();
 USART2_Init();
 while(1)
 {
 temp=calcTemp();
 hum=calcHumTemp(1);
 showTempLCD(temp, hum);


 LD2=1;
 my_Delay_ms(3000);
 LD2=0;
 }

}
