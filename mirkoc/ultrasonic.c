#include "ultrasonic.h"
#include "timer.h"

sbit TRIG at ODR14_GPIOD_ODR_bit;
sbit ECHO at IDR15_GPIOD_IDR_bit;

void initUltrasonic() {
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_14);
    GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_15);
}
double getDistance() {
   long cnt, echoValue;
   double distance;

   // start ultrasonic
   TRIG = 0;
   TRIG = 1;
   my_Delay_us(10);
   TRIG = 0;

   // recive ultrasonic
   cnt = 0;
   while (ECHO == 0);
   while (ECHO == 1) {
       cnt++;
       my_Delay_us(1);
   }

   // distance in cm (formula can be found in datasheet)
   distance = cnt / 58.0;
   return distance;
}