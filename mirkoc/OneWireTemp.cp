#line 1 "C:/Users/tasha/Desktop/projPrekidi/OneWireTemp.c"
#line 1 "c:/users/tasha/desktop/projprekidi/onewiretemp.h"





int oneWireReset();
void oneWireWrite(unsigned short byte);
unsigned short oneWireRead();
void InitTimerTemp();

float calcTemp();
#line 3 "C:/Users/tasha/Desktop/projPrekidi/OneWireTemp.c"
sbit OWDI at IDR7_GPIOB_IDR_bit;
sbit OWDO at ODR7_GPIOB_ODR_bit;
volatile unsigned int tick2;



void InitTimerTemp(){
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 0;
 TIM2_ARR = 59;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
 tick2=0;
}

void Timer2_interrupt() iv IVT_INT_TIM2 {
 TIM2_SR.UIF = 0;
 tick2++;
}




int oneWireReset(){
 int ret;

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;
 tick2=0;

 while(tick2<=480);
 OWDO = 1;
 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
 tick2=0;
 while(tick2<=70);

 ret = OWDI;
 if (ret == 0){
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 }
 tick2=0;

 while(tick2<=250);

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;


 return ret;
}

void oneWireWriteBit(unsigned short b){

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;
 if (b){
 tick2=0;

 while(tick2<=15);
 OWDO = 1;
 tick2=0;

 while(tick2<=50);
 } else{
 tick2=0;

 while(tick2<=65);
 OWDO = 1;
 }
}

int oneWireReadBit(){
 int b;


 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 OWDO = 0;

 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
 tick2=0;

 while(tick2<=5);
 b = OWDI;
 tick2=0;

 while(tick2<=55);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
 OWDO = 1;
 return b;
}

void oneWireWrite(unsigned short byte){
 int i;
 unsigned short b;
 for (i = 0; i < 8; i++){
 b = byte & 0x01;
 oneWireWriteBit(b);
 byte >>=1;
 }
}

unsigned short oneWireRead(){
 unsigned short byte, b;
 int i;
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
 unsigned short temp, test, tempDec;

 temp = 0;
 test = oneWireReset();
 oneWireWrite(0xCC);
 oneWireWrite(0x44);
 Delay_ms(750);
 test = oneWireReset();
 oneWireWrite(0xCC);
 oneWireWrite(0xBE);

 temp = oneWireRead();
 tempDec = 0x0F & temp;
 temp >>= 4;
 temp = (oneWireRead() << 4) + temp ;
 tempF= temp+tempDec*1.0/16;
 return tempF;

}
