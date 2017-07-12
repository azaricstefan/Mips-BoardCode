#line 1 "C:/Users/tasha/Desktop/projPrekidi/uart.c"
#line 1 "c:/users/tasha/desktop/projprekidi/uart.h"
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
#line 1 "c:/users/tasha/desktop/projprekidi/timer.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 6 "c:/users/tasha/desktop/projprekidi/timer.h"
void my_Delay_us(uint32_t num);
void InitTimerUs();

void my_Delay_ms(uint32_t num);
void InitTimerMs();
#line 36 "c:/users/tasha/desktop/projprekidi/uart.h"
typedef struct StructUART {
 uint8_t flag;
 uint16_t byteCount;
 uint16_t bufferPointer;
 uint8_t buffer[1600];
} StructUART;


extern volatile StructUART transmitUART, receiveUART;

void USART2_Send_Text(uint8_t* input);
void USART2_Init();
void sendData(float temp, float hum);
#line 3 "C:/Users/tasha/Desktop/projPrekidi/uart.c"
int32_t current = 0;
int32_t received_flag = 0;
int32_t kopirao = 0;



volatile StructUART transmitUART, receiveUART;


void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
{
 uint32_t usartStatusRegister, usartDataRegister;

 usartStatusRegister = USART2_SR;

 if(usartStatusRegister &  0x00000020UL )
 {
 receiveUART.flag = 1;
#line 40 "C:/Users/tasha/Desktop/projPrekidi/uart.c"
 usartDataRegister = USART2_DR;
 receiveUART.buffer[receiveUART.bufferPointer++] = usartDataRegister;
 ++receiveUART.byteCount;
 received_flag = 1;
 receiveUART.flag = 0;
 }

 if(usartStatusRegister &  0x00000080UL )
 {

 if(transmitUART.bufferPointer < transmitUART.byteCount)
 USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
 else
 {
 USART2_CR1 &= ~( 0x00000080UL );
 transmitUART.byteCount=0;
 transmitUART.bufferPointer = 0;
 transmitUART.flag = 0;
 }
 }

 if(usartStatusRegister &  0x00000008UL )
 {

 usartDataRegister = USART2_DR;
 }
}

void USART2_Init()
{

 receiveUART.flag = 0;
 receiveUART.byteCount = 0;
 receiveUART.bufferPointer = 0;
 transmitUART.flag = 0;
 transmitUART.byteCount = 0;
 transmitUART.bufferPointer = 0;


 RCC_AHB1ENR |=  0x00000008UL ;
 RCC_APB1ENR |=  0x00020000UL ;
 delay_ms(10);


 GPIOD_MODER |=  0x00002000UL  |  0x00000800UL ;
 GPIOD_OSPEEDR |=  0x00003000UL  |  0x00000C00UL ;
 GPIOD_AFRL |=  0x07000000UL  |  0x00700000UL ;
 NVIC_IPR9 |=  0x00000000UL ;
 NVIC_ISER1 |=  0x00000040UL ;
 USART2_BRR |=  0x00000C35UL ;
 USART2_CR1 |=  0x00002000UL  |  0x00000020UL  |  0x00000008UL  |  0x00000004UL ;
 delay_ms(10);
}

void USART2_SendReceived()
{
 receiveUART.flag = 0;
 if(received_flag==1)
 {
 transmitUART.byteCount = 3;
 transmitUART.buffer[0] = 0x0A;
 transmitUART.buffer[1] = 'R';
 transmitUART.buffer[2] = ':';
 for(current=0; current<receiveUART.byteCount; current++)
 {
 transmitUART.buffer[transmitUART.byteCount] = receiveUART.buffer[current];
 ++transmitUART.byteCount;
 }
 receiveUART.bufferPointer = 0;
 receiveUART.byteCount = 0;

 transmitUART.buffer[transmitUART.byteCount] = 0x0A;
 ++transmitUART.byteCount;

 received_flag = 0;

 transmitUART.bufferPointer = 0;

 transmitUART.flag = 1;
 USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
 USART2_CR1 |=  0x00000080UL ;
 }
 receiveUART.flag = 1;
}

void USART2_Send_Text(char* input)
{
 char input_Char = 0x00;

 while(transmitUART.flag == 1)
 {

 }
 receiveUART.flag = 0;

 transmitUART.byteCount = 0;
 input_Char = *input;
 while((input_Char>=0x20 && input_Char<=0x7E) || input_Char==0x09 || input_Char==0x0A || input_Char==0x0D)
 {
 transmitUART.buffer[transmitUART.byteCount] = input_Char;
 ++input;
 input_Char = *input;
 ++transmitUART.byteCount;
 }

 transmitUART.bufferPointer = 0;

 transmitUART.flag = 1;
 USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
 USART2_CR1 |=  0x00000080UL ;
}

void USART2_Send(char input)
{
 uint16_t reg = USART2_CR1;

 receiveUART.flag = 0;

 while(transmitUART.flag == 1)
 {

 }

 transmitUART.byteCount = 0;
 transmitUART.buffer[transmitUART.byteCount] = input;
 ++transmitUART.byteCount;
 transmitUART.bufferPointer = 0;


 transmitUART.flag = 1;
 USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
 USART2_CR1 |=  0x00000080UL ;
}

void send_SMS() {
 int cz = 0x1A;
 USART2_Send_Text("AT+CMGF=1\r\n");
 Delay_ms(1000);
 USART2_Send_Text("AT+CMGS=\"+381642914005\"\r\n");
 Delay_ms(1000);
 USART2_Send_Text("TEST TEST");
 Delay_ms(1000);
 USART2_Send(cz);
}

void sendData(float temp, float hum) {
 uint32_t len, i;
 uint8_t txtTemp[10], txtHum[10];
 uint8_t url[120] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
 len = strlen(url);
 FloatToStr(temp, txtTemp);

 FloatToStr(hum, txtHum);
 for (i = 0; i < strlen(txtTemp); i++) {
 if (txtTemp[i] == '\0') {
 break;
 }
 url[len++] = txtTemp[i];
 }

 url[len++] = '&';url[len++] = 'h';url[len++] = 'u';url[len++] = 'm';url[len++] = '=';

 for (i = 0; i < strlen(txtHum); i++) {
 if (txtHum[i] == '\0') {
 break;
 }
 url[len++] = txtHum[i];
 }
 url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';

 USART2_Send_Text("AT+CREG?\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+CIPSHUT\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+CGATT=1\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+SAPBR=1,1\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+HTTPTERM\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+HTTPINIT\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text(url);

 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+HTTPACTION=1\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+CIPSHUT\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+SAPBR=0,1\r\n");
 my_Delay_ms( 1000 );
 USART2_Send_Text("AT+CGATT=0\r\n");
 my_Delay_ms( 1000 );
}
