#include "OneWireTempHum.h"
#include "lcd.h"
#include "uart.h"
#include "bme280.h"
#include "ultrasonic.h"

sbit LD1 at ODR12_GPIOE_ODR_bit;
sbit LD2 at ODR15_GPIOE_ODR_bit;

float temp, hum, press, distance;


void initProg()
{
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);

  InitTimerUs();

  InitTimerMs();

  initLCD();
        TIM2_CR1.CEN = 1;
    TIM3_CR1.CEN = 1;
  USART2_Init();
        TIM2_CR1.CEN = 0;
    TIM3_CR1.CEN = 0;
  BME280_Init();
  RTCInit();
  initUltrasonic();
}

void interRTC() iv IVT_INT_RTC_WKUP ics ICS_AUTO {
     // RTC_ISR &= ~RTC_ISR_WUTF;
     //RTC_ISR.WUTF = 0;
     PWR_CR.DBP = 1;
  RTC_ISR.WUTF = 0; // Clear wake-up event flag
  PWR_CR.DBP = 0;
  EXTI_PR.PR22 = 1; // Clear wake-up interrupt flag
  while (RTC_ISR.RSF!=1) // Wait for RTC APB registers synchronization
    ;
        // code here
    TIM2_CR1.CEN = 1;
    TIM3_CR1.CEN = 1;
    temp=calcTemp();
    hum=calcHumTemp(1);
    press=0;
    TIM2_CR1.CEN = 0;
    TIM3_CR1.CEN = 0;
    press=getPressure();
    TIM2_CR1.CEN = 1;
    TIM3_CR1.CEN = 1;

    showTempLCD(distance, press);
    sendData(temp, hum,press);


    LD2=1;
    my_Delay_ms(3000);
    LD2=0;
    
    TIM2_CR1.CEN = 0;
    TIM3_CR1.CEN = 0;
}

void main() {
 double distance;
  initProg();
  // send_SMS();
  // UART3_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
  // UART3_Write_Text("MCU Start");
      TIM2_CR1.CEN = 1;
    TIM3_CR1.CEN = 1;

        showTempLCD(0, 1);
        my_Delay_ms(1000);
      distance = getDistance();
    showTempLCD(0, distance);
        TIM2_CR1.CEN = 0;
    TIM3_CR1.CEN = 0;
  
  while(1)
  {
      asm {WFI};
  }

}