#include "ultrasonic.h"
#include "timer.h"

sbit TRIG at ODR14_GPIOB_ODR_bit;
sbit ECHO at IDR15_GPIOB_IDR_bit;

void initUltrasonic() {
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_14);
    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);
}

double getDistance() {
   long cnt, echoValue;
   double distance;

   // start ultrasonic
   TRIG = 0;
   TRIG = 1;
   my_Delay_us(_ULTRASONIC_START_TIME);
   TRIG = 0;

   // recive ultrasonic
   cnt = 0;
   while (ECHO == 0);
   while (ECHO == 1) {
       cnt++;
       my_Delay_us(_ULTRASONIC_COUNT_TIME);
   }

   // distance in cm (formula can be found in datasheet)
   distance = cnt / 58.0;
   return distance;
}