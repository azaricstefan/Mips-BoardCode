#line 1 "C:/Users/tasha/Desktop/UART receive debug/lcd.c"
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
#line 3 "C:/Users/tasha/Desktop/UART receive debug/lcd.c"
sbit LCD_RS at GPIOD_ODR.B7;
sbit LCD_EN at GPIOC_ODR.B13;
sbit LCD_D4 at GPIOA_ODR.B1;
sbit LCD_D5 at GPIOA_ODR.B0;
sbit LCD_D6 at GPIOB_ODR.B10;
sbit LCD_D7 at GPIOB_ODR.B11;



void showTempLCD(float temp, float hum)
#line 26 "C:/Users/tasha/Desktop/UART receive debug/lcd.c"
{
}

void initLCD()
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);

 Lcd_Init();
 my_Delay_ms( 100 );
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"App start!");

}
