#line 1 "C:/Code/MMT koji ne radi/main.c"
#line 1 "c:/code/mmt koji ne radi/timer.h"
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
#line 9 "c:/code/mmt koji ne radi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();

void RTCInit(void);
#line 1 "c:/code/mmt koji ne radi/temperature.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/code/mmt koji ne radi/timer.h"
#line 31 "c:/code/mmt koji ne radi/temperature.h"
uint8_t oneWireReset();
void oneWireWrite(uint8_t byte);
unsigned short oneWireRead();

float calcTemp();
void setPrecision(uint8_t precision_);
#line 1 "c:/code/mmt koji ne radi/lcd.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/code/mmt koji ne radi/timer.h"
#line 9 "c:/code/mmt koji ne radi/lcd.h"
void showTempLCD(float temp, float hum);
void initLCD();

void showText(uint8_t* text);
#line 1 "c:/code/mmt koji ne radi/uart.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/code/mmt koji ne radi/timer.h"
#line 37 "c:/code/mmt koji ne radi/uart.h"
typedef struct TransmitStructUART {
 uint8_t flag;
 uint16_t byteCount;
 uint16_t bufferPointer;
 uint8_t buffer[1000];
} TransmitStructUART;

typedef struct ReceiveStructUART {
 uint8_t flag;
 uint16_t msgCount;
 uint16_t bufferPointerWrite;
 uint16_t bufferPointerRead;
 uint8_t buffer[1000];
} ReceiveStructUART;

void USART2_Send_Text(uint8_t* input);
void USART2_Init();
uint8_t sendData(float temp, float hum, float pres, float dist);
void sendSMS(char* number, int val);
void checkSMS();
#line 1 "c:/code/mmt koji ne radi/bme280.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 40 "c:/code/mmt koji ne radi/bme280.h"
void BME280_Init();
double getPressure();
double getTemperature();
#line 1 "c:/code/mmt koji ne radi/ultrasonic.h"










void initUltrasonic();
double getDistance();
#line 1 "c:/code/mmt koji ne radi/humidity.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/code/mmt koji ne radi/timer.h"
#line 15 "c:/code/mmt koji ne radi/humidity.h"
float calcHumTemp(uint8_t humB);
#line 9 "C:/Code/MMT koji ne radi/main.c"
sbit LD1 at ODR12_GPIOE_ODR_bit;
sbit LD2 at ODR15_GPIOE_ODR_bit;

float temp, hum, press, dist;
uint8_t ok, cnt;

int8_t rtcCounter= 6 ;

void initProg()
{
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
 InitTimerUs();
 InitTimerMs();

 TIM2_CR1.CEN = 1;
 TIM3_CR1.CEN = 1;
 initLCD();
 initUltrasonic();
 LD1=0; LD2=1;
 BME280_Init();
 LD1=0; LD2=0;
 USART2_Init();
 RTCInit();
 TIM2_CR1.CEN = 0;
 TIM3_CR1.CEN = 0;

}

void interRTC() iv IVT_INT_RTC_WKUP ics ICS_AUTO {
 PWR_CR.DBP = 1;
 RTC_ISR.WUTF = 0;
 PWR_CR.DBP = 0;
 EXTI_PR.PR22 = 1;
 while (RTC_ISR.RSF!=1);
 rtcCounter--;

 TIM2_CR1.CEN = 1;
 TIM3_CR1.CEN = 1;
 showText("pocni");
 checkSMS();
 showText("kraj");
 TIM2_CR1.CEN = 0;
 TIM3_CR1.CEN = 0;

 if(rtcCounter==0)
 {
 rtcCounter= 6 ;
 LD1=0; LD2=0;
 cnt=10;
 ok=0;
 press=getPressure();
 LD1=1; LD2=0;

 TIM2_CR1.CEN = 1;
 TIM3_CR1.CEN = 1;

 temp=calcTemp();

 hum=calcHumTemp(1);
 dist=getDistance();
 LD1=0; LD2=1;
 showTempLCD(temp,press);
 ok=0;
 while(ok==0 && cnt>0)
 {
 ok=sendData(temp, hum, press,dist);
 showTempLCD(ok,cnt);
 cnt--;
 }
 TIM2_CR1.CEN = 0;
 TIM3_CR1.CEN = 0;
 LD1=1; LD2=1;
 }
}

void main() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
 LD1=1;
 initProg();

 LD1=1; LD2=1;
 while(1)
 {
 asm {WFI};

 }
}
