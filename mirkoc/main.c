#include "OneWireTempHum.h"
#include "lcd.h"
#include "uart.h"

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
    //sendData(temp, hum);

    LD2=1;
    my_Delay_ms(3000);
    LD2=0;
  }

}