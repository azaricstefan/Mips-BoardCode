#line 1 "C:/Users/tasha/Desktop/UART receive debug/main.c"
#line 1 "c:/users/tasha/desktop/uart receive debug/lcd.h"
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
#line 1 "c:/users/tasha/desktop/uart receive debug/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 8 "c:/users/tasha/desktop/uart receive debug/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);
#line 9 "c:/users/tasha/desktop/uart receive debug/lcd.h"
void showTempLCD(float temp, float hum);
void initLCD();
#line 1 "c:/users/tasha/desktop/uart receive debug/uart.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/tasha/desktop/uart receive debug/timer.h"
#line 36 "c:/users/tasha/desktop/uart receive debug/uart.h"
typedef struct TransmitStructUART {
 uint8_t flag;
 uint16_t byteCount;
 uint16_t bufferPointer;
 uint8_t buffer[1000];
} TransmitStructUART;

typedef struct ReceiveStructUART {
 uint8_t flag;
 uint16_t msgCount;
 uint16_t bufferPointerWrite;
 uint16_t bufferPointerRead;
 uint8_t buffer[1000];
} ReceiveStructUART;

void USART2_Send_Text(uint8_t* input);
void USART2_Init();
uint8_t sendData(float temp, float hum, float pres, float dist);
void send_SMS();
#line 8 "C:/Users/tasha/Desktop/UART receive debug/main.c"
sbit LD1 at ODR12_GPIOE_ODR_bit;
sbit LD2 at ODR15_GPIOE_ODR_bit;

float temp, hum, press, dist;
uint8_t ok;

void initProg()
{
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
 InitTimerUs();
 InitTimerMs();

 TIM2_CR1.CEN = 1;
 TIM3_CR1.CEN = 1;
 initLCD();

 USART2_Init();

 ok=sendData(temp, hum, press,dist);
 showTempLCD(ok,ok);

 TIM2_CR1.CEN = 0;
 TIM3_CR1.CEN = 0;


}
#line 59 "C:/Users/tasha/Desktop/UART receive debug/main.c"
void main() {
 initProg();


 while(1)
 {
 asm {WFI};
 }
}
