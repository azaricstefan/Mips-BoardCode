#include "uart.h"

sbit DTR at ODR11_GPIOD_ODR_bit;

int32_t current = 0;
int32_t received_flag = 0;
int32_t kopirao = 0;


/* Global Variables */
volatile StructUART transmitUART, receiveUART;

/* Interrupt from USART2 Peripheral (IVT_INT_USART2 - Interrupt No: 38) */
void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
{
    uint32_t usartStatusRegister, usartDataRegister;

    usartStatusRegister = USART2_SR;

    if(usartStatusRegister & _USART_SR_RXNE)
    {
        receiveUART.flag = 1;

        usartDataRegister = USART2_DR;
        receiveUART.buffer[receiveUART.bufferPointer++] = usartDataRegister;
        ++receiveUART.byteCount;
        received_flag = 1;
        receiveUART.flag = 0;
    }

    if(usartStatusRegister & _USART_SR_TXE)
    {
       //Transmit register is EMPTY//
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

    if(usartStatusRegister & _USART_SR_ORE)
    {
       //Overrun error
       usartDataRegister = USART2_DR;
    }
}

void USART2_Init()
{
  //Initialize UART Variables
  receiveUART.flag = 0;
  receiveUART.byteCount = 0;
  receiveUART.bufferPointer = 0;
  transmitUART.flag = 0;
  transmitUART.byteCount = 0;
  transmitUART.bufferPointer = 0;

  //Enable Peripheral Clocks
  RCC_AHB1ENR |= _GPIOD_CLOCK_ENABLE; //Enable PORTD Clock
  RCC_APB1ENR |= _USART_CLOCK_ENABLE; //Enable USART Clock
  delay_ms(10);

  //Initialize UART module
  GPIOD_MODER |= _GPIOD_PIN6_MODE_AF | _GPIOD_PIN5_MODE_AF; //GPIOD Mode: Alternate Function
  GPIOD_OSPEEDR |= _GPIOD_PIN6_OSPEED_VERYHIGH | _GPIOD_PIN5_OSPEED_VERYHIGH; //GPIOD OSpeed: Very High Speed
  GPIOD_AFRL |= _GPIOD_PIN6_AF_USART2 | _GPIOD_PIN5_AF_USART2; //GPIOD AlternateFunction: USART2
  NVIC_IPR9 |= _NVIC_INT_USART2_PRIORITY_0;
  NVIC_ISER1 |= _NVIC_INT_USART2;
  USART2_BRR |= _USART_BAUD_RATE;
  USART2_CR1 |= _USART_ENABLE | _USART_RXNEIE | _USART_TE | _USART_RE;
  my_Delay_ms(10);
  
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);
  DTR = 0;
}

void USART2_SendReceived()
{
  receiveUART.flag = 0;
  if(received_flag==1)
  {
      transmitUART.byteCount = 3;
      transmitUART.buffer[0] = 0x0A; //S
      transmitUART.buffer[1] = 'R'; // S
      transmitUART.buffer[2] = ':'; // S
      for(current=0; current<receiveUART.byteCount; current++)
      {
        transmitUART.buffer[transmitUART.byteCount] = receiveUART.buffer[current];
        ++transmitUART.byteCount;
      }
      receiveUART.bufferPointer = 0;
      receiveUART.byteCount = 0;

      transmitUART.buffer[transmitUART.byteCount] = 0x0A; // CR+LF
      ++transmitUART.byteCount;
      //transmitUART.buffer[0] = receiveUART.byteCount+48;
      received_flag = 0;

      transmitUART.bufferPointer = 0;

      transmitUART.flag = 1;
      USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
      USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
  }
  receiveUART.flag = 1;
}

void USART2_Send_Text(char* input)
{
  char input_Char = 0x00;

  while(transmitUART.flag == 1)
  {
  //BusyWait for transmit register to get empty
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
  USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
  USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
}

void USART2_Send(char input)
{
  uint16_t reg = USART2_CR1;
  //USART2_CR1 &= ~_USART_TXEIE; //Enable TXE interrupt
  receiveUART.flag = 0;

  while(transmitUART.flag == 1)
  {
  //BusyWait for transmit register to get empty
  }

  transmitUART.byteCount = 0;
  transmitUART.buffer[transmitUART.byteCount] = input;
  ++transmitUART.byteCount;
  transmitUART.bufferPointer = 0;


  transmitUART.flag = 1;
  USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
  USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
}

void send_SMS() {
     int cz = 0x1A; // Ctrl + Z
     USART2_Send_Text("AT+CMGF=1\r\n");
     Delay_ms(1000);
     USART2_Send_Text("AT+CMGS=\"+381642914005\"\r\n");
     Delay_ms(1000);
     USART2_Send_Text("TEST TEST");
     Delay_ms(1000);
     USART2_Send(cz);
}

void sendData(float temp, float hum, float pres) {
     uint32_t len, i;
     uint8_t txtTemp[10], txtHum[10], txtPres[10];
     uint8_t url[150] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
     len = strlen(url);
     FloatToStr(temp, txtTemp);
     //UART3_Write_Text(txtTemp);
     FloatToStr(hum, txtHum);
    FloatToStr(pres, txtPres);
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
    
    url[len++] = '&';url[len++] = 'p';url[len++] = 'r';url[len++] = 'e';url[len++] = 's';url[len++] = '=';
    
    for (i = 0; i < strlen(txtPres); i++) {
        if (txtPres[i] == '\0') {
            break;
        }
        url[len++] = txtPres[i];
    }
    
     url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';

     // wake up
     DTR = 0;
     my_Delay_ms(50);

     USART2_Send_Text("AT+CREG?\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+CIPSHUT\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+CGATT=1\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+SAPBR=1,1\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+HTTPTERM\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+HTTPINIT\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text(url);
     //UART3_Write_Text(url);
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+HTTPACTION=1\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+CIPSHUT\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+SAPBR=0,1\r\n");
     my_Delay_ms(_TIMER_UART);
     USART2_Send_Text("AT+CGATT=0\r\n");
     my_Delay_ms(_TIMER_UART);
     
     // go to sleep
     DTR = 1;

}