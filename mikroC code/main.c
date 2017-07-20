//#include "temperature.h"
#include "lcd.h"
#include "uart.h"
//#include "bme280.h"
//#include "ultrasonic.h"
//#include "humidity.h"

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
  //LD1=1;
  ok=sendData(temp, hum, press,dist);
  showTempLCD(ok,ok);
  //BME280_Init();
  TIM2_CR1.CEN = 0;
  TIM3_CR1.CEN = 0;
  //RTCInit();
  //initUltrasonic();
}
    /*
void interRTC() iv IVT_INT_RTC_WKUP ics ICS_AUTO {
  PWR_CR.DBP = 1;
  RTC_ISR.WUTF = 0; // Clear wake-up event flag
  PWR_CR.DBP = 0;
  EXTI_PR.PR22 = 1; // Clear wake-up interrupt flag
  while (RTC_ISR.RSF!=1); // Wait for RTC APB registers synchronization
  
  LD1=0;
  LD2=0;
  //press=getPressure();
  TIM2_CR1.CEN = 1;
  TIM3_CR1.CEN = 1;
  //temp=calcTemp();
  //hum=calcHumTemp(1);              cc
  //dist=getDistance();
  // showTempLCD(temp,hum);
  ok=sendData(temp, hum, press,dist);
  showTempLCD(ok,ok);
  LD1=1;
  LD2=1;
  TIM2_CR1.CEN = 0;
  TIM3_CR1.CEN = 0;
}   */

void main() {
  initProg();
 // LD1=1;
 // LD2=1;
  while(1)
  {
      asm {WFI};
  }
}