#line 1 "C:/Code/MMT koji ne radi/humidity.c"
#line 1 "c:/code/mmt koji ne radi/humidity.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/code/mmt koji ne radi/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 8 "c:/code/mmt koji ne radi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);
#line 15 "c:/code/mmt koji ne radi/humidity.h"
float calcHumTemp(uint8_t humB);
#line 3 "C:/Code/MMT koji ne radi/humidity.c"
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
 my_Delay_ms( 18 );
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
 my_Delay_us( 70 );
 result = HUM_IN;
 if(res==1)
 return  -100 ;
 my_Delay_us( 130 );

 i=0;
 for(i;i<40;i++){
 while(HUM_IN == 0);
 my_Delay_us( 50 );
 array[i/8] |= HUM_IN<<(7-i%8);
 if(HUM_IN == 1)
 my_Delay_us( 50 );
 }
 for(i=0; i<4; i++)
 checksum+=array[i];
 if((checksum&0x00FF)!= array[4])
 return  -100 ;
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
