#include "temperature.h"
#include "lcd.h"
sbit OWDI at IDR1_GPIOB_IDR_bit;
sbit OWDO at ODR1_GPIOB_ODR_bit;

uint8_t scratchpad[9];
static uint8_t precision = 16;

uint8_t crc8()
{
  uint8_t crc, i, cur, mix,j; 
  crc = 0; 
  for(j=0;j<8; j++)
  {      
    cur=scratchpad[j];
    for (i = 0; i < 8; i++)
    {
      mix=crc^cur;
      crc=crc>>1;
      if (mix&0x01)
        crc=crc^0x8C;
      cur=cur>>1;
    }  
  }
  
  return crc;
}


uint8_t oneWireReset(){
    uint8_t ret;
    
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
    OWDO = 1;
    OWDO = 0;
    my_Delay_us(_TEMP_RESET_START); 
    OWDO = 1;
    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);

    my_Delay_us(_TEMP_RESET_1);
    ret = OWDI;
    if (ret == 0){
       GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
       OWDO = 1;
    }
    my_Delay_us(_TEMP_RESET_2); 

    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
    OWDO = 1;
    return ret;
}

void oneWireWriteBit(uint8_t b){
     GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
     OWDO = 1;
     OWDO = 0;
     if (b){
        my_Delay_us(_TEMP_READ_ONE_1);
        OWDO = 1;
        my_Delay_us(_TEMP_READ_ONE_2);
     } else{
        my_Delay_us(_TEMP_READ_ZERO);
        OWDO = 1;
     }
}

int oneWireReadBit(){
    uint8_t b;
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
    OWDO = 1;
    OWDO = 0;

    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
    my_Delay_us(_TEMP_READ_INIT); 
    b = OWDI;
    my_Delay_us(_TEMP_READ_WAIT); 
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
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
  uint8_t test, i,res;
  int measureTime;

  temp = 0;
  test = oneWireReset();
  oneWireWrite(0xCC);          //SKIP ROM
  
  oneWireWrite(0x4E);   // WRITE SCRATCHPAD from byte 2 to 5 (2,3,4)
  oneWireWrite(0x00);   // Alarm TH
  oneWireWrite(0x00);   // Alarm TL
  switch(precision) {
	  case _DOUBLE_PRECISION:
		oneWireWrite(_DOUBLE_PRECISION_CODED);
		measureTime = _WAIT_FOR_MESURING_x2;
		break;
	case _FOUR_PRECISION:
		oneWireWrite(_FOUR_PRECISION_CODED);
		measureTime = _WAIT_FOR_MESURING_x4;
		break;
	case _EIGHT_PRECISION:
		oneWireWrite(_EIGHT_PRECISION_CODED);
		measureTime = _WAIT_FOR_MESURING_x8
		break;
	default:
		oneWireWrite(_SIXTEEN_PRECISION_CODED);
		measureTime = _WAIT_FOR_MESURING_x16;
  }
  
  test = oneWireReset();
  oneWireWrite(0xCC);          //SKIP ROM
  oneWireWrite(0x44);          //CALC_TEMP
  my_Delay_ms(measureTime);     // Vreme merenja
  test = oneWireReset();
  oneWireWrite(0xCC);          //SKIP ROM
  oneWireWrite(0xBE);          //READ SCRATCHPAD

  for(i=0; i<9; i++)
  {
    scratchpad[i]=oneWireRead();
  }
   /*for(i=0; i<9; i++)
  {
      showTempLCD(i,scratchpad[i]);
      my_Delay_ms(1000);
  }*/

  temp=scratchpad[0];
  temp=temp+(scratchpad[1]<<8);
  res= crc8();
  if(res!=scratchpad[8])
    return _ERROR_TEMP;
    
  if(temp & 0xF000)
  {
    temp=(~temp)&0x0000FFFF;
    temp=temp+1;
    temp=-temp;
  }
  tempF=temp*1.0/16.0;
  return tempF;
}

void setPrecision(uint8_t precision_) {
	precision = precision_;
}