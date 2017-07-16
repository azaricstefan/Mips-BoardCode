#ifndef __SETUP_H
#define __SETUP_H

#include "stdint.h"
#include "timer.h"

#define     _TIMER_UART                     1000


/* UART Initialization Constants */
#define     _USART_ENABLE                   0x00002000UL
#define     _USART_TXEIE                    0x00000080UL
#define     _USART_RXNEIE                   0x00000020UL
#define     _USART_TE                       0x00000008UL
#define     _USART_RE                       0x00000004UL
#define     _USART_TWO_STOPBITS             0x00002000UL
#define     _USART_BAUD_RATE                0x00000C35UL //0x00000130UL
#define     _USART_CLOCK_ENABLE             0x00020000UL
#define     _GPIOD_CLOCK_ENABLE             0x00000008UL
#define     _GPIOD_PIN6_MODE_AF             0x00002000UL
#define     _GPIOD_PIN5_MODE_AF             0x00000800UL
#define     _GPIOD_PIN6_OSPEED_VERYHIGH     0x00003000UL
#define     _GPIOD_PIN5_OSPEED_VERYHIGH     0x00000C00UL
#define     _GPIOD_PIN6_AF_USART2           0x07000000UL
#define     _GPIOD_PIN5_AF_USART2           0x00700000UL
#define     _NVIC_INT_USART2                0x00000040UL
#define     _NVIC_INT_USART2_PRIORITY_0     0x00000000UL

/* UART Status Constants */
#define     _USART_SR_TXE                   0x00000080UL
#define     _USART_SR_RXNE                  0x00000020UL
#define     _USART_SR_ORE                   0x00000008UL
#define     _USART_SR_ERRORS                0x0000000BUL

/* Type definitions */
typedef struct StructUART {
        uint8_t flag;
        uint16_t byteCount;
        uint16_t bufferPointer;
        uint8_t buffer[1600];
} StructUART;

/* Global Variables */
extern volatile StructUART transmitUART, receiveUART;

void USART2_Send_Text(uint8_t* input);
void USART2_Init();
void sendData(float temp, float hum, float pres, float dist);
void send_SMS();
#endif