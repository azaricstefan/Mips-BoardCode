#line 1 "C:/Users/tasha/Desktop/projPrekidi/lcd.c"
#line 1 "c:/users/tasha/desktop/projprekidi/lcd.h"
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
#line 7 "c:/users/tasha/desktop/projprekidi/lcd.h"
void showTempLCD(float temp, float hum);
void initLCD();
#line 3 "C:/Users/tasha/Desktop/projPrekidi/lcd.c"
sbit LCD_RS at GPIOB_ODR.B11;
sbit LCD_EN at GPIOB_ODR.B10;
sbit LCD_D4 at GPIOA_ODR.B0;
sbit LCD_D5 at GPIOA_ODR.B1;
sbit LCD_D6 at GPIOC_ODR.B13;
sbit LCD_D7 at GPIOD_ODR.B7;

const int DELAY_LCD = 100;

void showTempLCD(float temp, float hum)
{
 uint8_t txtTemp[15];
 uint8_t txtHum[15];

 Lcd_Init();
 my_Delay_ms(DELAY_LCD);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 FloatToStr(temp,txtTemp);
 FloatToStr(hum,txtHum);
 Lcd_Out(1,1,"Temp:");
 Lcd_Out(2,1,"Hum:");
 Lcd_Out(1,7,txtTemp);
 Lcd_Out(2,7,txtHum);
}

void initLCD()
{
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_12);
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);
}
