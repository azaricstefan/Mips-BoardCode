#include "temperature.h"

sbit OWDI at IDR7_GPIOB_IDR_bit;
sbit OWDO at ODR7_GPIOB_ODR_bit;


uint8_t oneWireReset(){
    uint8_t ret;
    
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
    OWDO = 1;
    OWDO = 0;
    my_Delay_us(480);
    OWDO = 1;
    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);

    my_Delay_us(70);
    ret = OWDI;
    if (ret == 0){
       GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
       OWDO = 1;
    }
    my_Delay_us(250);

    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
    OWDO = 1;
    return ret;
}

void oneWireWriteBit(uint8_t b){
     GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
     OWDO = 1;
     OWDO = 0;
     if (b){
        my_Delay_us(15);
        OWDO = 1;
        my_Delay_us(50);
     } else{
        my_Delay_us(65);
        OWDO = 1;
     }
}

int oneWireReadBit(){
    uint8_t b;
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
    OWDO = 1;
    OWDO = 0;

    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
    my_Delay_us(5);
    b = OWDI;
    my_Delay_us(55);
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
    OWDO = 1;
    return b;
}

void oneWireWrite(unsigned short byte){
     uint8_t i, b;
     for (i = 0; i < 8; i++){
         b = byte & 0x01;
         oneWireWriteBit(b);
         byte >>=1;
     }
}

unsigned short oneWireRead(){
     uint8_t byte, b, i;
     byte = 0;
     for (i = 0; i < 8; i++){
         b = oneWireReadBit();
         b <<= i;
         byte |= b;
     }
     return byte;
}

float calcTemp()
{
  float tempF;
  int32_t temp;
  uint8_t test;

  temp = 0;
  test = oneWireReset();
  oneWireWrite(0xCC);          //SKIP ROM
  oneWireWrite(0x44);          //CALC_TEMP
  my_Delay_ms(750);     // Vreme merenja
  test = oneWireReset();
  oneWireWrite(0xCC);          //SKIP ROM
  oneWireWrite(0xBE);          //READ SCRATCHPAD

  temp=oneWireRead();
  temp=temp+(oneWireRead()<<8);
  if(temp & 0xF000)
  {
    temp=(~temp)&0x0000FFFF;
    temp=temp+1;
    temp=-temp;
  }
  tempF=temp*1.0/16.0;
  return tempF;
}