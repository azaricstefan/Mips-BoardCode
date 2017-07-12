_interruptUART:
;uart.c,12 :: 		void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
;uart.c,16 :: 		usartStatusRegister = USART2_SR;
MOVW	R0, #lo_addr(USART2_SR+0)
MOVT	R0, #hi_addr(USART2_SR+0)
; usartStatusRegister start address is: 8 (R2)
LDR	R2, [R0, #0]
;uart.c,18 :: 		if(usartStatusRegister & _USART_SR_RXNE)
AND	R0, R2, #32
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART0
;uart.c,20 :: 		receiveUART.flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,40 :: 		usartDataRegister = USART2_DR;
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
; usartDataRegister start address is: 12 (R3)
LDR	R3, [R0, #0]
;uart.c,41 :: 		receiveUART.buffer[receiveUART.bufferPointer++] = usartDataRegister;
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
ADDS	R0, R0, R1
STRB	R3, [R0, #0]
; usartDataRegister end address is: 12 (R3)
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,42 :: 		++receiveUART.byteCount;
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,43 :: 		received_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_received_flag+0)
MOVT	R0, #hi_addr(_received_flag+0)
STR	R1, [R0, #0]
;uart.c,44 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,45 :: 		}
L_interruptUART0:
;uart.c,47 :: 		if(usartStatusRegister & _USART_SR_TXE)
AND	R0, R2, #128
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART1
;uart.c,50 :: 		if(transmitUART.bufferPointer < transmitUART.byteCount)
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_interruptUART2
;uart.c,51 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
IT	AL
BAL	L_interruptUART3
L_interruptUART2:
;uart.c,54 :: 		USART2_CR1 &= ~(_USART_TXEIE);
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #128
ANDS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,55 :: 		transmitUART.byteCount=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,56 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,57 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,58 :: 		}
L_interruptUART3:
;uart.c,59 :: 		}
L_interruptUART1:
;uart.c,61 :: 		if(usartStatusRegister & _USART_SR_ORE)
AND	R0, R2, #8
; usartStatusRegister end address is: 8 (R2)
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART4
;uart.c,65 :: 		}
L_interruptUART4:
;uart.c,66 :: 		}
L_end_interruptUART:
BX	LR
; end of _interruptUART
_USART2_Init:
;uart.c,68 :: 		void USART2_Init()
;uart.c,71 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,72 :: 		receiveUART.byteCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,73 :: 		receiveUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,74 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,75 :: 		transmitUART.byteCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,76 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,79 :: 		RCC_AHB1ENR |= _GPIOD_CLOCK_ENABLE; //Enable PORTD Clock
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,80 :: 		RCC_APB1ENR |= _USART_CLOCK_ENABLE; //Enable USART Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,81 :: 		delay_ms(10);
MOVW	R7, #6782
MOVT	R7, #6
NOP
NOP
L_USART2_Init5:
SUBS	R7, R7, #1
BNE	L_USART2_Init5
NOP
NOP
NOP
;uart.c,84 :: 		GPIOD_MODER |= _GPIOD_PIN6_MODE_AF | _GPIOD_PIN5_MODE_AF; //GPIOD Mode: Alternate Function
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #10240
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;uart.c,85 :: 		GPIOD_OSPEEDR |= _GPIOD_PIN6_OSPEED_VERYHIGH | _GPIOD_PIN5_OSPEED_VERYHIGH; //GPIOD OSpeed: Very High Speed
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #15360
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,86 :: 		GPIOD_AFRL |= _GPIOD_PIN6_AF_USART2 | _GPIOD_PIN5_AF_USART2; //GPIOD AlternateFunction: USART2
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #124780544
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
STR	R1, [R0, #0]
;uart.c,87 :: 		NVIC_IPR9 |= _NVIC_INT_USART2_PRIORITY_0;
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
STR	R1, [R0, #0]
;uart.c,88 :: 		NVIC_ISER1 |= _NVIC_INT_USART2;
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
STR	R1, [R0, #0]
;uart.c,89 :: 		USART2_BRR |= _USART_BAUD_RATE;
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
LDR	R1, [R0, #0]
MOVW	R0, #3125
MOVT	R0, #0
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;uart.c,90 :: 		USART2_CR1 |= _USART_ENABLE | _USART_RXNEIE | _USART_TE | _USART_RE;
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8236
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,91 :: 		delay_ms(10);
MOVW	R7, #6782
MOVT	R7, #6
NOP
NOP
L_USART2_Init7:
SUBS	R7, R7, #1
BNE	L_USART2_Init7
NOP
NOP
NOP
;uart.c,92 :: 		}
L_end_USART2_Init:
BX	LR
; end of _USART2_Init
_USART2_SendReceived:
;uart.c,94 :: 		void USART2_SendReceived()
;uart.c,96 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,97 :: 		if(received_flag==1)
MOVW	R0, #lo_addr(_received_flag+0)
MOVT	R0, #hi_addr(_received_flag+0)
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_USART2_SendReceived9
;uart.c,99 :: 		transmitUART.byteCount = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,100 :: 		transmitUART.buffer[0] = 0x0A; //S
MOVS	R1, #10
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
STRB	R1, [R0, #0]
;uart.c,101 :: 		transmitUART.buffer[1] = 'R'; // S
MOVS	R1, #82
MOVW	R0, #lo_addr(_transmitUART+7)
MOVT	R0, #hi_addr(_transmitUART+7)
STRB	R1, [R0, #0]
;uart.c,102 :: 		transmitUART.buffer[2] = ':'; // S
MOVS	R1, #58
MOVW	R0, #lo_addr(_transmitUART+8)
MOVT	R0, #hi_addr(_transmitUART+8)
STRB	R1, [R0, #0]
;uart.c,103 :: 		for(current=0; current<receiveUART.byteCount; current++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_current+0)
MOVT	R0, #hi_addr(_current+0)
STR	R1, [R0, #0]
L_USART2_SendReceived10:
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_current+0)
MOVT	R0, #hi_addr(_current+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_USART2_SendReceived11
;uart.c,105 :: 		transmitUART.buffer[transmitUART.byteCount] = receiveUART.buffer[current];
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R3, R0, R1
MOVW	R2, #lo_addr(_current+0)
MOVT	R2, #hi_addr(_current+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R3, #0]
;uart.c,106 :: 		++transmitUART.byteCount;
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,103 :: 		for(current=0; current<receiveUART.byteCount; current++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;uart.c,107 :: 		}
IT	AL
BAL	L_USART2_SendReceived10
L_USART2_SendReceived11:
;uart.c,108 :: 		receiveUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,109 :: 		receiveUART.byteCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,111 :: 		transmitUART.buffer[transmitUART.byteCount] = 0x0A; // CR+LF
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R1, R0, R1
MOVS	R0, #10
STRB	R0, [R1, #0]
;uart.c,112 :: 		++transmitUART.byteCount;
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,114 :: 		received_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_received_flag+0)
MOVT	R0, #hi_addr(_received_flag+0)
STR	R1, [R0, #0]
;uart.c,116 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,118 :: 		transmitUART.flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,119 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,120 :: 		USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,121 :: 		}
L_USART2_SendReceived9:
;uart.c,122 :: 		receiveUART.flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,123 :: 		}
L_end_USART2_SendReceived:
BX	LR
; end of _USART2_SendReceived
_USART2_Send_Text:
;uart.c,125 :: 		void USART2_Send_Text(char* input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
;uart.c,127 :: 		char input_Char = 0x00;
MOV	R3, R0
; input end address is: 0 (R0)
;uart.c,129 :: 		while(transmitUART.flag == 1)
L_USART2_Send_Text13:
; input start address is: 12 (R3)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send_Text14
;uart.c,132 :: 		}
IT	AL
BAL	L_USART2_Send_Text13
L_USART2_Send_Text14:
;uart.c,133 :: 		receiveUART.flag = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_receiveUART+0)
MOVT	R1, #hi_addr(_receiveUART+0)
STRB	R2, [R1, #0]
;uart.c,135 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,136 :: 		input_Char = *input;
LDRB	R0, [R3, #0]
; input_Char start address is: 0 (R0)
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
;uart.c,137 :: 		while((input_Char>=0x20 && input_Char<=0x7E) || input_Char==0x09 || input_Char==0x0A || input_Char==0x0D)
L_USART2_Send_Text15:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
CMP	R0, #32
IT	CC
BCC	L__USART2_Send_Text40
CMP	R0, #126
IT	HI
BHI	L__USART2_Send_Text39
IT	AL
BAL	L__USART2_Send_Text37
L__USART2_Send_Text40:
L__USART2_Send_Text39:
CMP	R0, #9
IT	EQ
BEQ	L__USART2_Send_Text43
CMP	R0, #10
IT	EQ
BEQ	L__USART2_Send_Text42
CMP	R0, #13
IT	EQ
BEQ	L__USART2_Send_Text41
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text16
L__USART2_Send_Text37:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
L__USART2_Send_Text43:
L__USART2_Send_Text42:
L__USART2_Send_Text41:
;uart.c,139 :: 		transmitUART.buffer[transmitUART.byteCount] = input_Char;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input_Char end address is: 0 (R0)
;uart.c,140 :: 		++input;
ADDS	R1, R3, #1
MOV	R3, R1
;uart.c,141 :: 		input_Char = *input;
LDRB	R1, [R1, #0]
; input_Char start address is: 0 (R0)
UXTB	R0, R1
;uart.c,142 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,143 :: 		}
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text15
L_USART2_Send_Text16:
;uart.c,145 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,147 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,148 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(USART2_DR+0)
MOVT	R1, #hi_addr(USART2_DR+0)
STR	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,149 :: 		USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,150 :: 		}
L_end_USART2_Send_Text:
BX	LR
; end of _USART2_Send_Text
_USART2_Send:
;uart.c,152 :: 		void USART2_Send(char input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
;uart.c,156 :: 		receiveUART.flag = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_receiveUART+0)
MOVT	R1, #hi_addr(_receiveUART+0)
STRB	R2, [R1, #0]
; input end address is: 0 (R0)
;uart.c,158 :: 		while(transmitUART.flag == 1)
L_USART2_Send21:
; input start address is: 0 (R0)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send22
;uart.c,161 :: 		}
IT	AL
BAL	L_USART2_Send21
L_USART2_Send22:
;uart.c,163 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,164 :: 		transmitUART.buffer[transmitUART.byteCount] = input;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input end address is: 0 (R0)
;uart.c,165 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,166 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,169 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,170 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++]; //Initiate non blocking transfer by sending first byte
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(USART2_DR+0)
MOVT	R1, #hi_addr(USART2_DR+0)
STR	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,171 :: 		USART2_CR1 |= _USART_TXEIE; //Enable TXE interrupt
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,172 :: 		}
L_end_USART2_Send:
BX	LR
; end of _USART2_Send
_send_SMS:
;uart.c,174 :: 		void send_SMS() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,175 :: 		int cz = 0x1A; // Ctrl + Z
; cz start address is: 16 (R4)
MOVW	R4, #26
SXTH	R4, R4
;uart.c,176 :: 		USART2_Send_Text("AT+CMGF=1\r\n");
MOVW	R0, #lo_addr(?lstr1_uart+0)
MOVT	R0, #hi_addr(?lstr1_uart+0)
BL	_USART2_Send_Text+0
;uart.c,177 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_send_SMS23:
SUBS	R7, R7, #1
BNE	L_send_SMS23
NOP
NOP
NOP
;uart.c,178 :: 		USART2_Send_Text("AT+CMGS=\"+381642914005\"\r\n");
MOVW	R0, #lo_addr(?lstr2_uart+0)
MOVT	R0, #hi_addr(?lstr2_uart+0)
BL	_USART2_Send_Text+0
;uart.c,179 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_send_SMS25:
SUBS	R7, R7, #1
BNE	L_send_SMS25
NOP
NOP
NOP
;uart.c,180 :: 		USART2_Send_Text("TEST TEST");
MOVW	R0, #lo_addr(?lstr3_uart+0)
MOVT	R0, #hi_addr(?lstr3_uart+0)
BL	_USART2_Send_Text+0
;uart.c,181 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_send_SMS27:
SUBS	R7, R7, #1
BNE	L_send_SMS27
NOP
NOP
NOP
;uart.c,182 :: 		USART2_Send(cz);
UXTB	R0, R4
; cz end address is: 16 (R4)
BL	_USART2_Send+0
;uart.c,183 :: 		}
L_end_send_SMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _send_SMS
_sendData:
;uart.c,185 :: 		void sendData(float temp, float hum) {
SUB	SP, SP, #148
STR	LR, [SP, #0]
; hum start address is: 4 (R1)
; temp start address is: 0 (R0)
VMOV.F32	S2, S1
; hum end address is: 4 (R1)
; temp end address is: 0 (R0)
; temp start address is: 0 (R0)
; hum start address is: 8 (R2)
;uart.c,188 :: 		uint8_t url[120] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
ADD	R11, SP, #28
ADD	R10, R11, #120
MOVW	R12, #lo_addr(?ICSsendData_url_L0+0)
MOVT	R12, #hi_addr(?ICSsendData_url_L0+0)
BL	___CC2DW+0
;uart.c,189 :: 		len = strlen(url);
ADD	R2, SP, #28
MOV	R0, R2
BL	_strlen+0
; len start address is: 32 (R8)
SXTH	R8, R0
;uart.c,190 :: 		FloatToStr(temp, txtTemp);
ADD	R2, SP, #8
MOV	R0, R2
; temp end address is: 0 (R0)
BL	_FloatToStr+0
;uart.c,192 :: 		FloatToStr(hum, txtHum);
ADD	R2, SP, #18
MOV	R0, R2
VMOV.F32	S0, S2
; hum end address is: 8 (R2)
BL	_FloatToStr+0
;uart.c,193 :: 		for (i = 0; i < strlen(txtTemp); i++) {
; i start address is: 16 (R4)
MOVS	R4, #0
; len end address is: 32 (R8)
; i end address is: 16 (R4)
MOV	R5, R8
L_sendData29:
; i start address is: 16 (R4)
; len start address is: 20 (R5)
ADD	R2, SP, #8
MOV	R0, R2
BL	_strlen+0
CMP	R4, R0
IT	CS
BCS	L_sendData30
;uart.c,194 :: 		if (txtTemp[i] == '\0') {
ADD	R2, SP, #8
ADDS	R2, R2, R4
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_sendData32
; i end address is: 16 (R4)
;uart.c,195 :: 		break;
IT	AL
BAL	L_sendData30
;uart.c,196 :: 		}
L_sendData32:
;uart.c,197 :: 		url[len++] = txtTemp[i];
; i start address is: 16 (R4)
ADD	R2, SP, #28
ADDS	R3, R2, R5
ADD	R2, SP, #8
ADDS	R2, R2, R4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R5, R5, #1
;uart.c,193 :: 		for (i = 0; i < strlen(txtTemp); i++) {
ADDS	R4, R4, #1
;uart.c,198 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_sendData29
L_sendData30:
;uart.c,200 :: 		url[len++] = '&';url[len++] = 'h';url[len++] = 'u';url[len++] = 'm';url[len++] = '=';
ADD	R4, SP, #28
ADDS	R3, R4, R5
MOVS	R2, #38
STRB	R2, [R3, #0]
ADDS	R2, R5, #1
; len end address is: 20 (R5)
; len start address is: 0 (R0)
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #104
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #117
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #109
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #61
STRB	R2, [R3, #0]
ADDS	R1, R0, #1
; len end address is: 0 (R0)
; len start address is: 4 (R1)
;uart.c,202 :: 		for (i = 0; i < strlen(txtHum); i++) {
; i start address is: 16 (R4)
MOVS	R4, #0
; len end address is: 4 (R1)
; i end address is: 16 (R4)
L_sendData33:
; i start address is: 16 (R4)
; len start address is: 4 (R1)
ADD	R2, SP, #18
STR	R1, [SP, #4]
MOV	R0, R2
BL	_strlen+0
LDR	R1, [SP, #4]
CMP	R4, R0
IT	CS
BCS	L_sendData34
;uart.c,203 :: 		if (txtHum[i] == '\0') {
ADD	R2, SP, #18
ADDS	R2, R2, R4
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_sendData36
; i end address is: 16 (R4)
;uart.c,204 :: 		break;
IT	AL
BAL	L_sendData34
;uart.c,205 :: 		}
L_sendData36:
;uart.c,206 :: 		url[len++] = txtHum[i];
; i start address is: 16 (R4)
ADD	R2, SP, #28
ADDS	R3, R2, R1
ADD	R2, SP, #18
ADDS	R2, R2, R4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R1, R1, #1
;uart.c,202 :: 		for (i = 0; i < strlen(txtHum); i++) {
ADDS	R4, R4, #1
;uart.c,207 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_sendData33
L_sendData34:
;uart.c,208 :: 		url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';
ADD	R4, SP, #28
ADDS	R3, R4, R1
MOVS	R2, #34
STRB	R2, [R3, #0]
ADDS	R2, R1, #1
; len end address is: 4 (R1)
; len start address is: 0 (R0)
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #13
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
MOV	R0, R2
ADDS	R3, R4, R2
MOVS	R2, #10
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
; len end address is: 0 (R0)
ADDS	R3, R4, R2
MOVS	R2, #0
STRB	R2, [R3, #0]
;uart.c,210 :: 		USART2_Send_Text("AT+CREG?\r\n");
MOVW	R2, #lo_addr(?lstr4_uart+0)
MOVT	R2, #hi_addr(?lstr4_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,211 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,212 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R2, #lo_addr(?lstr5_uart+0)
MOVT	R2, #hi_addr(?lstr5_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,213 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,214 :: 		USART2_Send_Text("AT+CGATT=1\r\n");
MOVW	R2, #lo_addr(?lstr6_uart+0)
MOVT	R2, #hi_addr(?lstr6_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,215 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,216 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
MOVW	R2, #lo_addr(?lstr7_uart+0)
MOVT	R2, #hi_addr(?lstr7_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,217 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,218 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n");
MOVW	R2, #lo_addr(?lstr8_uart+0)
MOVT	R2, #hi_addr(?lstr8_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,219 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,220 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n");
MOVW	R2, #lo_addr(?lstr9_uart+0)
MOVT	R2, #hi_addr(?lstr9_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,221 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,222 :: 		USART2_Send_Text("AT+SAPBR=1,1\r\n");
MOVW	R2, #lo_addr(?lstr10_uart+0)
MOVT	R2, #hi_addr(?lstr10_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,223 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,224 :: 		USART2_Send_Text("AT+HTTPTERM\r\n");
MOVW	R2, #lo_addr(?lstr11_uart+0)
MOVT	R2, #hi_addr(?lstr11_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,225 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,226 :: 		USART2_Send_Text("AT+HTTPINIT\r\n");
MOVW	R2, #lo_addr(?lstr12_uart+0)
MOVT	R2, #hi_addr(?lstr12_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,227 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,228 :: 		USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
MOVW	R2, #lo_addr(?lstr13_uart+0)
MOVT	R2, #hi_addr(?lstr13_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,229 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,230 :: 		USART2_Send_Text(url);
ADD	R2, SP, #28
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,232 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,233 :: 		USART2_Send_Text("AT+HTTPACTION=1\r\n");
MOVW	R2, #lo_addr(?lstr14_uart+0)
MOVT	R2, #hi_addr(?lstr14_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,234 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,235 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R2, #lo_addr(?lstr15_uart+0)
MOVT	R2, #hi_addr(?lstr15_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,236 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,237 :: 		USART2_Send_Text("AT+SAPBR=0,1\r\n");
MOVW	R2, #lo_addr(?lstr16_uart+0)
MOVT	R2, #hi_addr(?lstr16_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,238 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,239 :: 		USART2_Send_Text("AT+CGATT=0\r\n");
MOVW	R2, #lo_addr(?lstr17_uart+0)
MOVT	R2, #hi_addr(?lstr17_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,240 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #1000
BL	_my_Delay_ms+0
;uart.c,241 :: 		}
L_end_sendData:
LDR	LR, [SP, #0]
ADD	SP, SP, #148
BX	LR
; end of _sendData
