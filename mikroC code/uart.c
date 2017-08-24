#include "uart.h"
#include "lcd.h"
#include "temperature.h"

uint8_t receivedFlag = 0;
uint8_t receivedTxt[300];

volatile TransmitStructUART transmitUART;
volatile ReceiveStructUART receiveUART;

void USART2_Init()
{   
    //Enable Peripheral Clocks
    RCC_AHB1ENR |= _GPIOD_CLOCK_ENABLE; //Enable PORTD Clock
    RCC_APB1ENR |= _USART_CLOCK_ENABLE; //Enable USART Clock
    my_Delay_ms(_UART_INIT_DELAY);
    
    //Initialize UART module
    GPIOD_MODER |= _GPIOD_PIN6_MODE_AF | _GPIOD_PIN5_MODE_AF; //GPIOD Mode: Alternate Function
    GPIOD_OSPEEDR |= _GPIOD_PIN6_OSPEED_VERYHIGH | _GPIOD_PIN5_OSPEED_VERYHIGH; //GPIOD OSpeed: Very High Speed
    GPIOD_AFRL |= _GPIOD_PIN6_AF_USART2 | _GPIOD_PIN5_AF_USART2; //GPIOD AlternateFunction: USART2
    NVIC_IPR9 |= _NVIC_INT_USART2_PRIORITY_0;
    NVIC_ISER1 |= _NVIC_INT_USART2;
    USART2_BRR |= _USART_BAUD_RATE;
    USART2_CR1 |= _USART_ENABLE | _USART_RXNEIE | _USART_TE | _USART_RE;
    my_Delay_ms(_UART_INIT_DELAY);
    NVIC_SetIntPriority(IVT_INT_USART2, _NVIC_INT_PRIORITY_LVL0);
 
     //Initialize UART Variables
    receiveUART.flag = 0;
    receiveUART.bufferPointerWrite = 0;
    receiveUART.bufferPointerRead = 0;
    receiveUART.msgCount=0;
    transmitUART.flag = 0;
    transmitUART.byteCount = 0;
    transmitUART.bufferPointer = 0; 
    
    USART2_Send_Text("AT+CLCC\r\n");
    my_Delay_ms(_TIMER_UART);
    USART2_Send_Text("AT+CMGF=1\r\n");
    my_Delay_ms(_TIMER_UART);
}

void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
{
  uint32_t usartStatusRegister, usartDataRegister;
  usartStatusRegister = USART2_SR;
  
  if(usartStatusRegister & _USART_SR_RXNE)
  {
    receiveUART.flag = 1;
    usartDataRegister = USART2_DR;
    receiveUART.buffer[receiveUART.bufferPointerWrite] = usartDataRegister;
    receiveUART.bufferPointerWrite++;
    if(receiveUART.bufferPointerWrite==1000)
      receiveUART.bufferPointerWrite=0;
    if(usartDataRegister==0x0A)
    {
      receiveUART.msgCount++;
      receiveUART.flag = 0;
    }
  }
  
  if(usartStatusRegister & _USART_SR_TXE)
  {
    if(transmitUART.bufferPointer < transmitUART.byteCount)
      USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
    else
    {
      USART2_CR1 &= ~(_USART_TXEIE);
      transmitUART.byteCount=0;
      transmitUART.bufferPointer = 0;
      transmitUART.flag = 0;
    }
  }
}

void USART2_Receive()
{
  int32_t current;
  if(receiveUART.msgCount>0)
  {
    current=0;
    receiveUART.msgCount--;
    while(receiveUART.buffer[receiveUART.bufferPointerRead]!=0x0A)
    {
      receivedTxt[current]=receiveUART.buffer[receiveUART.bufferPointerRead++];
      current++;
      if(receiveUART.bufferPointerRead==1000)
        receiveUART.bufferPointerRead=0;
    }
    receiveUART.bufferPointerRead++;
    if(receiveUART.bufferPointerRead==1000)
        receiveUART.bufferPointerRead=0;
    receivedTxt[current]=0;
    receivedFlag=1;
  }
  else
    receivedFlag=0;
}


void receive_SMS()
{
     USART2_Receive();
     if(receivedFlag==1 && receivedTxt[0]=='+' && receivedTxt[1]=='C' &&   receivedTxt[2]=='M' && receivedTxt[3]=='G' && receivedTxt[4]=='L' && receivedTxt[5]==':')
     {
       int pos=0;
       int numQuote=0;
       char number[20];
       int posNum=0;
       while(numQuote<3)
       {
         if(receivedTxt[pos]=='"')
           numQuote++;
         pos++;
       }
       while(receivedTxt[pos]!='"')
       {
         number[posNum]=receivedTxt[pos];
         posNum++;
         pos++;
       }
       numQuote++;
       pos++;
       number[posNum]=0;
       USART2_Receive();
       if(receivedFlag==1 && receivedTxt[0]=='p' && receivedTxt[1]=='r' && receivedTxt[2]=='e' && receivedTxt[3]=='c' && receivedTxt[4]==':')
       {
           int val=0;
           int p=5;
           while(receivedTxt[p]!='\r')
               val=val*10+receivedTxt[p++]-'0';
           setPrecision(val);
           sendSMS(number, val);
       	}
     }  
}

void checkSMS(){
  USART2_Send_Text("AT+CMGL=\"ALL\"\r\n");
  my_Delay_ms(_TIMER_UART);
  receive_SMS();
  while(receivedFlag==1)
    receive_SMS();
  USART2_Send_Text("AT+CMGD=1,4\r\n");
}

void USART2_Send_Text(uint8_t* input)
{
  uint8_t input_Char;
  int32_t current;
  while(transmitUART.flag == 1);  //BusyWait for transmit register to get empty

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
  USART2_CR1 |= _USART_TXEIE;
}

void USART2_Send(char input)
{
  while(transmitUART.flag == 1);//BusyWait for transmit register to get empty

  transmitUART.byteCount = 0;
  transmitUART.buffer[transmitUART.byteCount] = input;
  ++transmitUART.byteCount;
  
  transmitUART.bufferPointer = 0;

  transmitUART.flag = 1;
  USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
  USART2_CR1 |= _USART_TXEIE; 
}


void sendSMS(char* number, int val) {
  int cz = 0x1A; // Ctrl + Z
  int pos=9;
  int posNum=0;
  char txtNum[50];
  USART2_Send_Text("AT+CMGF=1\r\n");
  Delay_ms(1000);
  txtNum[0]='A';  txtNum[1]='T';   txtNum[2]='+';   txtNum[3]='C';   txtNum[4]='M';  txtNum[5]='G';   txtNum[6]='S';  txtNum[7]='=';  txtNum[8]='"';
  while(number[posNum]!=0)
  {
    txtNum[pos]=number[posNum];
    pos++;
    posNum++;
  }
  txtNum[pos++]='"';
  txtNum[pos++]='\r';
  txtNum[pos++]='\n';
  txtNum[pos++]='\0';
  //USART2_Send_Text(txtNum);
  USART2_Send_Text("AT+CMGS=\"+381642914005\"\r\n");
  Delay_ms(1000);
  USART2_Send_Text(receivedTxt);
  Delay_ms(1000);
  USART2_Send(cz); 
}

uint8_t getReceiveTxt()
{
  USART2_Receive();
  while(receivedFlag==1)
    USART2_Receive();
}

uint8_t checkReceiveTxt()
{
  uint8_t ok=0;
  uint32_t current;
  USART2_Receive();
  while(receivedFlag==1)
  {
    for(current=1; receivedTxt[current]!=0; current++)
      if((receivedTxt[current-1]=='O')&& (receivedTxt[current]=='K'))
        ok=1;
    USART2_Receive();
  }
  return ok; 
}

uint8_t sendData(float temp, float hum, float pres, float dist) {
   uint32_t len, i;
   uint8_t txtTemp[10], txtHum[10], txtPres[10], txtDist[10];
   uint8_t url[150] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
   len = strlen(url);
   FloatToStr(temp, txtTemp);
   FloatToStr(hum, txtHum);
   FloatToStr(pres, txtPres);
   FloatToStr(dist, txtDist);
   for (i = 0; i < strlen(txtTemp); i++) {
     if (txtTemp[i] == '\0')
        break;
     url[len++] = txtTemp[i];
   }

   url[len++] = '&';url[len++] = 'h';url[len++] = 'u';url[len++] = 'm';url[len++] = '=';

   for (i = 0; i < strlen(txtHum); i++) {
     if (txtHum[i] == '\0')
        break;
     url[len++] = txtHum[i];
   }
  
  url[len++] = '&';url[len++] = 'p';url[len++] = 'r';url[len++] = 'e';url[len++] = 's';url[len++] = '=';
  
  for (i = 0; i < strlen(txtPres); i++) {
    if (txtPres[i] == '\0')
        break;
    url[len++] = txtPres[i];
  }
  
  url[len++] = '&';url[len++] = 'd';url[len++] = 'i';url[len++] = 's';url[len++] = 't';url[len++] = '=';

  for (i = 0; i < strlen(txtDist); i++) {
    if (txtDist[i] == '\0')
        break;
    url[len++] = txtDist[i];
  }
  url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';

  USART2_Send_Text("AT+CPIN?\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
  USART2_Send_Text("AT+CIPSHUT\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;

  USART2_Send_Text("AT+CGATT=1\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;

  USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;

  USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n"); // telenor
  //USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"gprswap\"\r\n");  // mts
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n"); // telenor
  //USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"064\"\r\n"); // mts
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+SAPBR=1,1\r\n");
  my_Delay_ms(3*_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+HTTPTERM\r\n");
  my_Delay_ms(_TIMER_UART);
  getReceiveTxt();
    
  USART2_Send_Text("AT+HTTPINIT\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text(url);
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+HTTPACTION=1\r\n");
  my_Delay_ms(_TIMER_UART);
  if(checkReceiveTxt()==0) return 0;
    
  USART2_Send_Text("AT+CIPSHUT\r\n");
  my_Delay_ms(_TIMER_UART);
  getReceiveTxt();
    
  USART2_Send_Text("AT+SAPBR=0,1\r\n");
  my_Delay_ms(_TIMER_UART);
  getReceiveTxt();
    
  USART2_Send_Text("AT+CGATT=0\r\n");
  my_Delay_ms(3*_TIMER_UART);
  getReceiveTxt();
   
  return 1;
}
