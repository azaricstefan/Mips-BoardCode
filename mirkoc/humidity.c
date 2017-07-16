#include "humidity.h"

sbit HUM_OUT at ODR7_GPIOC_ODR_bit;
sbit HUM_IN at IDR7_GPIOC_IDR_bit;

float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
  uint32_t result = 1, i = 0;
  uint8_t array[5];
  float res=0;
  for(i;i<5;i++)
    array[i] = 0;
 // DisableInterrupts();
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
  HUM_OUT = 1;
  HUM_OUT = 0;
  my_Delay_ms(18);
  GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
  my_Delay_us(70);
  result = HUM_IN;
  my_Delay_us(130);

  i=0;
  for(i;i<40;i++){
    while(HUM_IN == 0); //CEKAJ UPOSLENO!
    my_Delay_us(50);
    if(HUM_IN == 0)
      array[i/8] |= HUM_IN<<(7-i%8);
    else
    {
      array[i/8] |= HUM_IN<<(7-i%8);
      my_Delay_us(50);
    }
  }
 // EnableInterrupts();
  if(humB==0)
  {
    res=array[2]&0x7F;
    res=res*25.6+array[3]*0.1;
    if(array[2]&0x80)
      res=-res;
  }
  else
  {
    res=array[0]&0x7F;
    res=res*25.6+array[1]*0.1;
    if(array[0]&0x80)
      res=-res;
  }
  return res;
}