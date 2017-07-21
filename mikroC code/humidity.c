#include "humidity.h"

sbit HUM_OUT at ODR1_GPIOC_ODR_bit;
sbit HUM_IN at IDR1_GPIOC_IDR_bit;


float calcHumTemp(uint8_t humB){ 
  uint32_t result = 1, i = 0;
  uint8_t array[5];
  uint32_t checksum=0;
  float res=0;
  for(i;i<5;i++)
    array[i] = 0;
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_1);
  HUM_OUT = 1;
  HUM_OUT = 0;
  my_Delay_ms(_INIT_TIME_SET);
  GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
  my_Delay_us(_INIT_TIME_WAIT_1);
  result = HUM_IN;
  if(res==1)
    return _ERROR_HUM;
  my_Delay_us(_INIT_TIME_WAIT_2);

  i=0;
  for(i;i<40;i++){
    while(HUM_IN == 0); 
    my_Delay_us(_TIME_HUM_READ);
    array[i/8] |= HUM_IN<<(7-i%8);
    if(HUM_IN == 1)
      my_Delay_us(_TIME_HUM_READ);  
  }
  for(i=0; i<4; i++)
    checksum+=array[i];
  if((checksum&0x00FF)!= array[4])
    return _ERROR_HUM;
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