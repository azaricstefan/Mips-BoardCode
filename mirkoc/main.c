#include "OneWireTempHum.h"
#include "lcd.h"
#include "uart.h"
#include "bme280.h"

sbit LD1 at ODR12_GPIOE_ODR_bit;
sbit LD2 at ODR15_GPIOE_ODR_bit;

float temp, hum,pres;


void initProg()
{
  InitTimerUs();
  InitTimerMs();
  initLCD();
  USART2_Init();
  BME280_Init();
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
}

void main() {
  initProg();
  
  while(1)
  {
    temp=calcTemp();
    hum=calcHumTemp(1);
    showTempLCD(temp, hum);
    pres=getPressure();
    sendData(temp, hum,pres);

    LD2=1;
    my_Delay_ms(3000);
    LD2=0;
  }

}
