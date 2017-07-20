#include "lcd.h"

sbit LCD_RS at GPIOD_ODR.B7;
sbit LCD_EN at GPIOC_ODR.B13;
sbit LCD_D4 at GPIOA_ODR.B1;
sbit LCD_D5 at GPIOA_ODR.B0;
sbit LCD_D6 at GPIOB_ODR.B10;
sbit LCD_D7 at GPIOB_ODR.B11;



void showTempLCD(float temp, float hum)
{   /*
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
  Lcd_Out(2,7,txtHum);    */
}

void initLCD()
{
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0  | _GPIO_PINMASK_1);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11);
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);
  
  Lcd_Init();
  my_Delay_ms(DELAY_LCD);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,1,"App start!");

}