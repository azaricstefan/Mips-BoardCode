_USART2_Init:
;uart.c,11 :: 		void USART2_Init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,14 :: 		RCC_AHB1ENR |= _GPIOD_CLOCK_ENABLE; //Enable PORTD Clock
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,15 :: 		RCC_APB1ENR |= _USART_CLOCK_ENABLE; //Enable USART Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,16 :: 		my_Delay_ms(_UART_INIT_DELAY);
MOVS	R0, #10
BL	_my_Delay_ms+0
;uart.c,19 :: 		GPIOD_MODER |= _GPIOD_PIN6_MODE_AF | _GPIOD_PIN5_MODE_AF; //GPIOD Mode: Alternate Function
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #10240
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;uart.c,20 :: 		GPIOD_OSPEEDR |= _GPIOD_PIN6_OSPEED_VERYHIGH | _GPIOD_PIN5_OSPEED_VERYHIGH; //GPIOD OSpeed: Very High Speed
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #15360
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,21 :: 		GPIOD_AFRL |= _GPIOD_PIN6_AF_USART2 | _GPIOD_PIN5_AF_USART2; //GPIOD AlternateFunction: USART2
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #124780544
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
STR	R1, [R0, #0]
;uart.c,22 :: 		NVIC_IPR9 |= _NVIC_INT_USART2_PRIORITY_0;
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
STR	R1, [R0, #0]
;uart.c,23 :: 		NVIC_ISER1 |= _NVIC_INT_USART2;
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
STR	R1, [R0, #0]
;uart.c,24 :: 		USART2_BRR |= _USART_BAUD_RATE;
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
LDR	R1, [R0, #0]
MOVW	R0, #3125
MOVT	R0, #0
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;uart.c,25 :: 		USART2_CR1 |= _USART_ENABLE | _USART_RXNEIE | _USART_TE | _USART_RE;
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8236
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,26 :: 		my_Delay_ms(_UART_INIT_DELAY);
MOVS	R0, #10
BL	_my_Delay_ms+0
;uart.c,27 :: 		NVIC_SetIntPriority(IVT_INT_USART2, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #54
BL	_NVIC_SetIntPriority+0
;uart.c,30 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,31 :: 		receiveUART.bufferPointerWrite = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,32 :: 		receiveUART.bufferPointerRead = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
;uart.c,33 :: 		receiveUART.msgCount=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,34 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,35 :: 		transmitUART.byteCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,36 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,38 :: 		USART2_Send_Text("AT+CLCC\r\n");
MOVW	R0, #lo_addr(?lstr1_uart+0)
MOVT	R0, #hi_addr(?lstr1_uart+0)
BL	_USART2_Send_Text+0
;uart.c,39 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,40 :: 		USART2_Send_Text("AT+CMGF=1\r\n");
MOVW	R0, #lo_addr(?lstr2_uart+0)
MOVT	R0, #hi_addr(?lstr2_uart+0)
BL	_USART2_Send_Text+0
;uart.c,41 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,42 :: 		}
L_end_USART2_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_Init
_interruptUART:
;uart.c,44 :: 		void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
;uart.c,47 :: 		usartStatusRegister = USART2_SR;
MOVW	R0, #lo_addr(USART2_SR+0)
MOVT	R0, #hi_addr(USART2_SR+0)
; usartStatusRegister start address is: 8 (R2)
LDR	R2, [R0, #0]
;uart.c,49 :: 		if(usartStatusRegister & _USART_SR_RXNE)
AND	R0, R2, #32
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART0
;uart.c,51 :: 		receiveUART.flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,52 :: 		usartDataRegister = USART2_DR;
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
; usartDataRegister start address is: 12 (R3)
LDR	R3, [R0, #0]
;uart.c,53 :: 		receiveUART.buffer[receiveUART.bufferPointerWrite] = usartDataRegister;
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+8)
MOVT	R0, #hi_addr(_receiveUART+8)
ADDS	R0, R0, R1
STRB	R3, [R0, #0]
;uart.c,54 :: 		receiveUART.bufferPointerWrite++;
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,55 :: 		if(receiveUART.bufferPointerWrite==1000)
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_interruptUART1
;uart.c,56 :: 		receiveUART.bufferPointerWrite=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
L_interruptUART1:
;uart.c,57 :: 		if(usartDataRegister==0x0A)
CMP	R3, #10
IT	NE
BNE	L_interruptUART2
; usartDataRegister end address is: 12 (R3)
;uart.c,59 :: 		receiveUART.msgCount++;
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,60 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,61 :: 		}
L_interruptUART2:
;uart.c,62 :: 		}
L_interruptUART0:
;uart.c,64 :: 		if(usartStatusRegister & _USART_SR_TXE)
AND	R0, R2, #128
; usartStatusRegister end address is: 8 (R2)
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART3
;uart.c,66 :: 		if(transmitUART.bufferPointer < transmitUART.byteCount)
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_interruptUART4
;uart.c,67 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
BAL	L_interruptUART5
L_interruptUART4:
;uart.c,70 :: 		USART2_CR1 &= ~(_USART_TXEIE);
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #128
ANDS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,71 :: 		transmitUART.byteCount=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,72 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,73 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,74 :: 		}
L_interruptUART5:
;uart.c,75 :: 		}
L_interruptUART3:
;uart.c,76 :: 		}
L_end_interruptUART:
BX	LR
; end of _interruptUART
_USART2_Receive:
;uart.c,78 :: 		void USART2_Receive()
;uart.c,81 :: 		if(receiveUART.msgCount>0)
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_USART2_Receive6
;uart.c,83 :: 		current=0;
; current start address is: 12 (R3)
MOVS	R3, #0
;uart.c,84 :: 		receiveUART.msgCount--;
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
; current end address is: 12 (R3)
;uart.c,85 :: 		while(receiveUART.buffer[receiveUART.bufferPointerRead]!=0x0A)
L_USART2_Receive7:
; current start address is: 12 (R3)
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+8)
MOVT	R0, #hi_addr(_receiveUART+8)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_USART2_Receive8
;uart.c,87 :: 		receivedTxt[current]=receiveUART.buffer[receiveUART.bufferPointerRead++];
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+8)
MOVT	R0, #hi_addr(_receiveUART+8)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
;uart.c,88 :: 		current++;
ADDS	R3, R3, #1
;uart.c,89 :: 		if(receiveUART.bufferPointerRead==1000)
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive9
;uart.c,90 :: 		receiveUART.bufferPointerRead=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive9:
;uart.c,91 :: 		}
IT	AL
BAL	L_USART2_Receive7
L_USART2_Receive8:
;uart.c,92 :: 		receiveUART.bufferPointerRead++;
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
;uart.c,93 :: 		if(receiveUART.bufferPointerRead==1000)
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive10
;uart.c,94 :: 		receiveUART.bufferPointerRead=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive10:
;uart.c,95 :: 		receivedTxt[current]=0;
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R1, R0, R3
; current end address is: 12 (R3)
MOVS	R0, #0
STRB	R0, [R1, #0]
;uart.c,96 :: 		receivedFlag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
;uart.c,97 :: 		}
IT	AL
BAL	L_USART2_Receive11
L_USART2_Receive6:
;uart.c,99 :: 		receivedFlag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
L_USART2_Receive11:
;uart.c,100 :: 		}
L_end_USART2_Receive:
BX	LR
; end of _USART2_Receive
_receive_SMS:
;uart.c,103 :: 		void receive_SMS()
SUB	SP, SP, #92
STR	LR, [SP, #0]
;uart.c,105 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,107 :: 		if(receivedFlag==1 && receivedTxt[0]=='+' && receivedTxt[1]=='C' &&   receivedTxt[2]=='M' && receivedTxt[3]=='G' && receivedTxt[4]=='L' && receivedTxt[5]==':')
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__receive_SMS112
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
LDRB	R0, [R0, #0]
CMP	R0, #43
IT	NE
BNE	L__receive_SMS111
MOVW	R0, #lo_addr(_receivedTxt+1)
MOVT	R0, #hi_addr(_receivedTxt+1)
LDRB	R0, [R0, #0]
CMP	R0, #67
IT	NE
BNE	L__receive_SMS110
MOVW	R0, #lo_addr(_receivedTxt+2)
MOVT	R0, #hi_addr(_receivedTxt+2)
LDRB	R0, [R0, #0]
CMP	R0, #77
IT	NE
BNE	L__receive_SMS109
MOVW	R0, #lo_addr(_receivedTxt+3)
MOVT	R0, #hi_addr(_receivedTxt+3)
LDRB	R0, [R0, #0]
CMP	R0, #71
IT	NE
BNE	L__receive_SMS108
MOVW	R0, #lo_addr(_receivedTxt+4)
MOVT	R0, #hi_addr(_receivedTxt+4)
LDRB	R0, [R0, #0]
CMP	R0, #76
IT	NE
BNE	L__receive_SMS107
MOVW	R0, #lo_addr(_receivedTxt+5)
MOVT	R0, #hi_addr(_receivedTxt+5)
LDRB	R0, [R0, #0]
CMP	R0, #58
IT	NE
BNE	L__receive_SMS106
L__receive_SMS99:
;uart.c,109 :: 		int pos=0;
;uart.c,110 :: 		int numQuote=0;
; numQuote start address is: 16 (R4)
MOVW	R4, #0
SXTH	R4, R4
;uart.c,112 :: 		int posNum=0;
; posNum start address is: 12 (R3)
MOVW	R3, #0
SXTH	R3, R3
;uart.c,115 :: 		pos = 6;
; pos start address is: 8 (R2)
MOVS	R2, #6
SXTH	R2, R2
; numQuote end address is: 16 (R4)
; posNum end address is: 12 (R3)
; pos end address is: 8 (R2)
;uart.c,116 :: 		while(receivedTxt[pos] != ','){
L_receive_SMS15:
; pos start address is: 8 (R2)
; posNum start address is: 12 (R3)
; numQuote start address is: 16 (R4)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #44
IT	EQ
BEQ	L_receive_SMS16
;uart.c,117 :: 		tt[pos-6] = receivedTxt[pos];
SUBS	R1, R2, #6
SXTH	R1, R1
ADD	R0, SP, #28
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;uart.c,118 :: 		pos++;
ADDS	R2, R2, #1
SXTH	R2, R2
;uart.c,119 :: 		}
IT	AL
BAL	L_receive_SMS15
L_receive_SMS16:
;uart.c,120 :: 		tt[pos-6] = 0;
SUBS	R1, R2, #6
SXTH	R1, R1
ADD	R0, SP, #28
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
; numQuote end address is: 16 (R4)
; posNum end address is: 12 (R3)
; pos end address is: 8 (R2)
SXTH	R1, R3
SXTH	R3, R4
;uart.c,121 :: 		while(numQuote<3)
L_receive_SMS17:
; numQuote start address is: 12 (R3)
; posNum start address is: 4 (R1)
; pos start address is: 8 (R2)
CMP	R3, #3
IT	GE
BGE	L_receive_SMS18
;uart.c,123 :: 		if(receivedTxt[pos]=='"')
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #34
IT	NE
BNE	L__receive_SMS113
;uart.c,124 :: 		numQuote++;
ADDS	R3, R3, #1
SXTH	R3, R3
; numQuote end address is: 12 (R3)
IT	AL
BAL	L_receive_SMS19
L__receive_SMS113:
;uart.c,123 :: 		if(receivedTxt[pos]=='"')
;uart.c,124 :: 		numQuote++;
L_receive_SMS19:
;uart.c,125 :: 		pos++;
; numQuote start address is: 12 (R3)
ADDS	R2, R2, #1
SXTH	R2, R2
;uart.c,126 :: 		}
; numQuote end address is: 12 (R3)
IT	AL
BAL	L_receive_SMS17
L_receive_SMS18:
;uart.c,127 :: 		while(receivedTxt[pos]!='"')
SXTH	R3, R1
; pos end address is: 8 (R2)
L_receive_SMS20:
; posNum end address is: 4 (R1)
; pos start address is: 8 (R2)
; posNum start address is: 12 (R3)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #34
IT	EQ
BEQ	L_receive_SMS21
;uart.c,129 :: 		number[posNum]=receivedTxt[pos];
ADD	R0, SP, #8
ADDS	R1, R0, R3
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;uart.c,130 :: 		posNum++;
ADDS	R3, R3, #1
SXTH	R3, R3
;uart.c,131 :: 		pos++;
ADDS	R2, R2, #1
SXTH	R2, R2
;uart.c,132 :: 		}
; pos end address is: 8 (R2)
IT	AL
BAL	L_receive_SMS20
L_receive_SMS21:
;uart.c,135 :: 		number[posNum]=0;
ADD	R0, SP, #8
ADDS	R1, R0, R3
; posNum end address is: 12 (R3)
MOVS	R0, #0
STRB	R0, [R1, #0]
;uart.c,136 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,137 :: 		showText(receivedTxt);
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
BL	_showText+0
;uart.c,138 :: 		if(receivedFlag==1 && receivedTxt[0]=='p' && receivedTxt[1]=='r' && receivedTxt[2]=='e' && receivedTxt[3]=='c' && receivedTxt[4]==':')
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__receive_SMS105
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
LDRB	R0, [R0, #0]
CMP	R0, #112
IT	NE
BNE	L__receive_SMS104
MOVW	R0, #lo_addr(_receivedTxt+1)
MOVT	R0, #hi_addr(_receivedTxt+1)
LDRB	R0, [R0, #0]
CMP	R0, #114
IT	NE
BNE	L__receive_SMS103
MOVW	R0, #lo_addr(_receivedTxt+2)
MOVT	R0, #hi_addr(_receivedTxt+2)
LDRB	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L__receive_SMS102
MOVW	R0, #lo_addr(_receivedTxt+3)
MOVT	R0, #hi_addr(_receivedTxt+3)
LDRB	R0, [R0, #0]
CMP	R0, #99
IT	NE
BNE	L__receive_SMS101
MOVW	R0, #lo_addr(_receivedTxt+4)
MOVT	R0, #hi_addr(_receivedTxt+4)
LDRB	R0, [R0, #0]
CMP	R0, #58
IT	NE
BNE	L__receive_SMS100
L__receive_SMS98:
;uart.c,140 :: 		int val=0;
; val start address is: 12 (R3)
MOVW	R3, #0
SXTH	R3, R3
;uart.c,141 :: 		int p=5;
; p start address is: 8 (R2)
MOVW	R2, #5
SXTH	R2, R2
; val end address is: 12 (R3)
; p end address is: 8 (R2)
;uart.c,142 :: 		while(receivedTxt[p]!='\r')
L_receive_SMS25:
; p start address is: 8 (R2)
; val start address is: 12 (R3)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_receive_SMS26
;uart.c,143 :: 		val=val*10+receivedTxt[p++]-'0';
MOVS	R0, #10
SXTH	R0, R0
MUL	R1, R3, R0
SXTH	R1, R1
; val end address is: 12 (R3)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
SXTH	R0, R0
SUBS	R0, #48
; val start address is: 12 (R3)
SXTH	R3, R0
ADDS	R2, R2, #1
SXTH	R2, R2
; p end address is: 8 (R2)
IT	AL
BAL	L_receive_SMS25
L_receive_SMS26:
;uart.c,144 :: 		setPrecision(val);
STRH	R3, [SP, #4]
UXTB	R0, R3
BL	_setPrecision+0
LDRSH	R3, [SP, #4]
;uart.c,145 :: 		sendSMS(number, val);
ADD	R0, SP, #8
SXTH	R1, R3
; val end address is: 12 (R3)
BL	_sendSMS+0
;uart.c,138 :: 		if(receivedFlag==1 && receivedTxt[0]=='p' && receivedTxt[1]=='r' && receivedTxt[2]=='e' && receivedTxt[3]=='c' && receivedTxt[4]==':')
L__receive_SMS105:
L__receive_SMS104:
L__receive_SMS103:
L__receive_SMS102:
L__receive_SMS101:
L__receive_SMS100:
;uart.c,148 :: 		strcpy(bufff, "AT+CMGD=");
MOVW	R1, #lo_addr(?lstr3_uart+0)
MOVT	R1, #hi_addr(?lstr3_uart+0)
ADD	R0, SP, #34
BL	_strcpy+0
;uart.c,149 :: 		strcpy(bufff+8, tt);
ADD	R1, SP, #28
ADD	R0, SP, #34
ADDS	R0, #8
BL	_strcpy+0
;uart.c,150 :: 		strcpy(bufff+8+strlen(tt),",0\r\n");
MOVW	R0, #lo_addr(?lstr4_uart+0)
MOVT	R0, #hi_addr(?lstr4_uart+0)
STR	R0, [SP, #88]
ADD	R0, SP, #34
ADDS	R0, #8
STR	R0, [SP, #84]
ADD	R0, SP, #28
BL	_strlen+0
LDR	R1, [SP, #84]
ADDS	R1, R1, R0
LDR	R0, [SP, #88]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
BL	_strcpy+0
;uart.c,151 :: 		USART2_Send_Text(bufff);
ADD	R0, SP, #34
BL	_USART2_Send_Text+0
;uart.c,153 :: 		my_Delay_ms(5000);
MOVW	R0, #5000
BL	_my_Delay_ms+0
;uart.c,107 :: 		if(receivedFlag==1 && receivedTxt[0]=='+' && receivedTxt[1]=='C' &&   receivedTxt[2]=='M' && receivedTxt[3]=='G' && receivedTxt[4]=='L' && receivedTxt[5]==':')
L__receive_SMS112:
L__receive_SMS111:
L__receive_SMS110:
L__receive_SMS109:
L__receive_SMS108:
L__receive_SMS107:
L__receive_SMS106:
;uart.c,156 :: 		}
L_end_receive_SMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #92
BX	LR
; end of _receive_SMS
_checkSMS:
;uart.c,158 :: 		void checkSMS(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,159 :: 		USART2_Send_Text("AT+CMGL=\"REC UNREAD\"\r\n");
MOVW	R0, #lo_addr(?lstr5_uart+0)
MOVT	R0, #hi_addr(?lstr5_uart+0)
BL	_USART2_Send_Text+0
;uart.c,160 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,161 :: 		receive_SMS();
BL	_receive_SMS+0
;uart.c,162 :: 		while(receivedFlag==1)
L_checkSMS27:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_checkSMS28
;uart.c,163 :: 		receive_SMS();
BL	_receive_SMS+0
IT	AL
BAL	L_checkSMS27
L_checkSMS28:
;uart.c,165 :: 		}
L_end_checkSMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkSMS
_USART2_Send_Text:
;uart.c,167 :: 		void USART2_Send_Text(uint8_t* input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
MOV	R3, R0
; input end address is: 0 (R0)
;uart.c,171 :: 		while(transmitUART.flag == 1);  //BusyWait for transmit register to get empty
L_USART2_Send_Text29:
; input start address is: 12 (R3)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send_Text30
IT	AL
BAL	L_USART2_Send_Text29
L_USART2_Send_Text30:
;uart.c,173 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,174 :: 		input_Char = *input;
LDRB	R0, [R3, #0]
; input_Char start address is: 0 (R0)
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
;uart.c,175 :: 		while((input_Char>=0x20 && input_Char<=0x7E) || input_Char==0x09 || input_Char==0x0A || input_Char==0x0D)
L_USART2_Send_Text31:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
CMP	R0, #32
IT	CC
BCC	L__USART2_Send_Text94
CMP	R0, #126
IT	HI
BHI	L__USART2_Send_Text93
IT	AL
BAL	L__USART2_Send_Text91
L__USART2_Send_Text94:
L__USART2_Send_Text93:
CMP	R0, #9
IT	EQ
BEQ	L__USART2_Send_Text97
CMP	R0, #10
IT	EQ
BEQ	L__USART2_Send_Text96
CMP	R0, #13
IT	EQ
BEQ	L__USART2_Send_Text95
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text32
L__USART2_Send_Text91:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
L__USART2_Send_Text97:
L__USART2_Send_Text96:
L__USART2_Send_Text95:
;uart.c,177 :: 		transmitUART.buffer[transmitUART.byteCount] = input_Char;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input_Char end address is: 0 (R0)
;uart.c,178 :: 		++input;
ADDS	R1, R3, #1
MOV	R3, R1
;uart.c,179 :: 		input_Char = *input;
LDRB	R1, [R1, #0]
; input_Char start address is: 0 (R0)
UXTB	R0, R1
;uart.c,180 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,181 :: 		}
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text31
L_USART2_Send_Text32:
;uart.c,183 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,185 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,186 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
;uart.c,187 :: 		USART2_CR1 |= _USART_TXEIE;
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,188 :: 		}
L_end_USART2_Send_Text:
BX	LR
; end of _USART2_Send_Text
_USART2_Send:
;uart.c,190 :: 		void USART2_Send(char input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
;uart.c,192 :: 		while(transmitUART.flag == 1);//BusyWait for transmit register to get empty
L_USART2_Send37:
; input start address is: 0 (R0)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send38
IT	AL
BAL	L_USART2_Send37
L_USART2_Send38:
;uart.c,194 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,195 :: 		transmitUART.buffer[transmitUART.byteCount] = input;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input end address is: 0 (R0)
;uart.c,196 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,198 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,200 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,201 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
;uart.c,202 :: 		USART2_CR1 |= _USART_TXEIE;
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,203 :: 		}
L_end_USART2_Send:
BX	LR
; end of _USART2_Send
_sendSMS:
;uart.c,206 :: 		void sendSMS(char* number, int val) {
; val start address is: 4 (R1)
; number start address is: 0 (R0)
SUB	SP, SP, #60
STR	LR, [SP, #0]
MOV	R5, R0
SXTH	R6, R1
; val end address is: 4 (R1)
; number end address is: 0 (R0)
; number start address is: 20 (R5)
; val start address is: 24 (R6)
;uart.c,207 :: 		int cz = 0x1A; // Ctrl + Z
; cz start address is: 28 (R7)
MOVW	R7, #26
SXTH	R7, R7
;uart.c,208 :: 		int pos=9;
; pos start address is: 32 (R8)
MOVW	R8, #9
SXTH	R8, R8
;uart.c,209 :: 		int posNum=0;
; posNum start address is: 36 (R9)
MOVW	R9, #0
SXTH	R9, R9
;uart.c,212 :: 		USART2_Send_Text("AT+CMGF=1\r\n");
MOVW	R2, #lo_addr(?lstr6_uart+0)
MOVT	R2, #hi_addr(?lstr6_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,213 :: 		Delay_ms(1000);
STRH	R7, [SP, #4]
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS39:
SUBS	R7, R7, #1
BNE	L_sendSMS39
NOP
NOP
NOP
LDRSH	R7, [SP, #4]
;uart.c,214 :: 		txtNum[0]='A';  txtNum[1]='T';   txtNum[2]='+';   txtNum[3]='C';   txtNum[4]='M';  txtNum[5]='G';   txtNum[6]='S';  txtNum[7]='=';  txtNum[8]='"';
ADD	R4, SP, #8
MOVS	R2, #65
STRB	R2, [R4, #0]
ADDS	R3, R4, #1
MOVS	R2, #84
STRB	R2, [R3, #0]
ADDS	R3, R4, #2
MOVS	R2, #43
STRB	R2, [R3, #0]
ADDS	R3, R4, #3
MOVS	R2, #67
STRB	R2, [R3, #0]
ADDS	R3, R4, #4
MOVS	R2, #77
STRB	R2, [R3, #0]
ADDS	R3, R4, #5
MOVS	R2, #71
STRB	R2, [R3, #0]
ADDS	R3, R4, #6
MOVS	R2, #83
STRB	R2, [R3, #0]
ADDS	R3, R4, #7
MOVS	R2, #61
STRB	R2, [R3, #0]
ADDW	R3, R4, #8
MOVS	R2, #34
STRB	R2, [R3, #0]
; number end address is: 20 (R5)
; cz end address is: 28 (R7)
; pos end address is: 32 (R8)
; posNum end address is: 36 (R9)
; val end address is: 24 (R6)
MOV	R0, R5
SXTH	R5, R7
SXTH	R7, R8
SXTH	R1, R9
;uart.c,215 :: 		while(number[posNum]!=0)
L_sendSMS41:
; posNum start address is: 4 (R1)
; pos start address is: 28 (R7)
; cz start address is: 20 (R5)
; val start address is: 24 (R6)
; number start address is: 0 (R0)
ADDS	R2, R0, R1
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_sendSMS42
;uart.c,217 :: 		txtNum[pos]=number[posNum];
ADD	R2, SP, #8
ADDS	R3, R2, R7
ADDS	R2, R0, R1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;uart.c,218 :: 		pos++;
ADDS	R7, R7, #1
SXTH	R7, R7
;uart.c,219 :: 		posNum++;
ADDS	R1, R1, #1
SXTH	R1, R1
;uart.c,220 :: 		}
; number end address is: 0 (R0)
; posNum end address is: 4 (R1)
IT	AL
BAL	L_sendSMS41
L_sendSMS42:
;uart.c,221 :: 		txtNum[pos++]='"';
ADD	R4, SP, #8
ADDS	R3, R4, R7
MOVS	R2, #34
STRB	R2, [R3, #0]
ADDS	R2, R7, #1
SXTH	R2, R2
; pos end address is: 28 (R7)
; pos start address is: 0 (R0)
SXTH	R0, R2
;uart.c,222 :: 		txtNum[pos++]='\r';
ADDS	R3, R4, R2
MOVS	R2, #13
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
SXTH	R2, R2
SXTH	R0, R2
;uart.c,223 :: 		txtNum[pos++]='\n';
ADDS	R3, R4, R2
MOVS	R2, #10
STRB	R2, [R3, #0]
ADDS	R2, R0, #1
SXTH	R2, R2
; pos end address is: 0 (R0)
;uart.c,224 :: 		txtNum[pos++]=0;
ADDS	R3, R4, R2
MOVS	R2, #0
STRB	R2, [R3, #0]
;uart.c,225 :: 		USART2_Send_Text(txtNum);
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,227 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS43:
SUBS	R7, R7, #1
BNE	L_sendSMS43
NOP
NOP
NOP
;uart.c,230 :: 		switch(val) {
IT	AL
BAL	L_sendSMS45
; val end address is: 24 (R6)
;uart.c,231 :: 		case _DOUBLE_PRECISION:
L_sendSMS47:
;uart.c,232 :: 		USART2_Send_Text("Promenjena preciznost na: 1/2 stepena");
MOVW	R2, #lo_addr(?lstr7_uart+0)
MOVT	R2, #hi_addr(?lstr7_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,233 :: 		break;
IT	AL
BAL	L_sendSMS46
;uart.c,234 :: 		case _FOUR__PRECISION:
L_sendSMS48:
;uart.c,235 :: 		USART2_Send_Text("Promenjena preciznost na: 1/4 stepena");
MOVW	R2, #lo_addr(?lstr8_uart+0)
MOVT	R2, #hi_addr(?lstr8_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,236 :: 		break;
IT	AL
BAL	L_sendSMS46
;uart.c,237 :: 		case _EIGHT_PRECISION:
L_sendSMS49:
;uart.c,238 :: 		USART2_Send_Text("Promenjena preciznost na: 1/8 stepena");
MOVW	R2, #lo_addr(?lstr9_uart+0)
MOVT	R2, #hi_addr(?lstr9_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,239 :: 		break;
IT	AL
BAL	L_sendSMS46
;uart.c,240 :: 		case _SIXTEEN_PRECISION:
L_sendSMS50:
;uart.c,241 :: 		USART2_Send_Text("Promenjena preciznost na: 1/16 stepena");
MOVW	R2, #lo_addr(?lstr10_uart+0)
MOVT	R2, #hi_addr(?lstr10_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,242 :: 		break;
IT	AL
BAL	L_sendSMS46
;uart.c,243 :: 		default:
L_sendSMS51:
;uart.c,244 :: 		USART2_Send_Text("Greska: podesavanje nije moguce promeniti,\n postavljeno je podrazumevano podesavanje na 1/16 stepana");
MOVW	R2, #lo_addr(?lstr11_uart+0)
MOVT	R2, #hi_addr(?lstr11_uart+0)
MOV	R0, R2
BL	_USART2_Send_Text+0
;uart.c,246 :: 		}
IT	AL
BAL	L_sendSMS46
L_sendSMS45:
; val start address is: 24 (R6)
CMP	R6, #2
IT	EQ
BEQ	L_sendSMS47
CMP	R6, #4
IT	EQ
BEQ	L_sendSMS48
CMP	R6, #8
IT	EQ
BEQ	L_sendSMS49
CMP	R6, #16
IT	EQ
BEQ	L_sendSMS50
; val end address is: 24 (R6)
IT	AL
BAL	L_sendSMS51
L_sendSMS46:
;uart.c,251 :: 		USART2_Send(cz);
UXTB	R0, R5
; cz end address is: 20 (R5)
BL	_USART2_Send+0
;uart.c,252 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS52:
SUBS	R7, R7, #1
BNE	L_sendSMS52
NOP
NOP
NOP
;uart.c,253 :: 		}
L_end_sendSMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #60
BX	LR
; end of _sendSMS
_getReceiveTxt:
;uart.c,255 :: 		uint8_t getReceiveTxt()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,257 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,258 :: 		while(receivedFlag==1)
L_getReceiveTxt54:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_getReceiveTxt55
;uart.c,259 :: 		USART2_Receive();
BL	_USART2_Receive+0
IT	AL
BAL	L_getReceiveTxt54
L_getReceiveTxt55:
;uart.c,260 :: 		}
L_end_getReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getReceiveTxt
_checkReceiveTxt:
;uart.c,262 :: 		uint8_t checkReceiveTxt()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,264 :: 		uint8_t ok=0;
; ok start address is: 16 (R4)
MOVS	R4, #0
;uart.c,266 :: 		USART2_Receive();
BL	_USART2_Receive+0
; ok end address is: 16 (R4)
;uart.c,267 :: 		while(receivedFlag==1)
L_checkReceiveTxt56:
; ok start address is: 16 (R4)
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_checkReceiveTxt57
;uart.c,269 :: 		for(current=1; receivedTxt[current]!=0; current++)
; current start address is: 8 (R2)
MOVS	R2, #1
; ok end address is: 16 (R4)
; current end address is: 8 (R2)
L_checkReceiveTxt58:
; current start address is: 8 (R2)
; ok start address is: 16 (R4)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkReceiveTxt59
;uart.c,270 :: 		if((receivedTxt[current-1]=='O')&& (receivedTxt[current]=='K'))
SUBS	R1, R2, #1
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	NE
BNE	L__checkReceiveTxt117
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	NE
BNE	L__checkReceiveTxt118
; ok end address is: 16 (R4)
L__checkReceiveTxt114:
;uart.c,271 :: 		ok=1;
; ok start address is: 0 (R0)
MOVS	R0, #1
; ok end address is: 0 (R0)
UXTB	R4, R0
;uart.c,270 :: 		if((receivedTxt[current-1]=='O')&& (receivedTxt[current]=='K'))
IT	AL
BAL	L__checkReceiveTxt116
L__checkReceiveTxt117:
L__checkReceiveTxt116:
; ok start address is: 16 (R4)
; ok end address is: 16 (R4)
IT	AL
BAL	L__checkReceiveTxt115
L__checkReceiveTxt118:
L__checkReceiveTxt115:
;uart.c,269 :: 		for(current=1; receivedTxt[current]!=0; current++)
; ok start address is: 16 (R4)
ADDS	R2, R2, #1
;uart.c,271 :: 		ok=1;
; current end address is: 8 (R2)
IT	AL
BAL	L_checkReceiveTxt58
L_checkReceiveTxt59:
;uart.c,272 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,273 :: 		}
IT	AL
BAL	L_checkReceiveTxt56
L_checkReceiveTxt57:
;uart.c,274 :: 		return ok;
UXTB	R0, R4
; ok end address is: 16 (R4)
;uart.c,275 :: 		}
L_end_checkReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkReceiveTxt
_sendData:
;uart.c,277 :: 		uint8_t sendData(float temp, float hum, float pres, float dist) {
SUB	SP, SP, #200
STR	LR, [SP, #0]
; dist start address is: 12 (R3)
; pres start address is: 8 (R2)
; hum start address is: 4 (R1)
; temp start address is: 0 (R0)
VMOV.F32	S4, S3
VMOV.F32	S3, S2
VMOV.F32	S2, S1
; dist end address is: 12 (R3)
; pres end address is: 8 (R2)
; hum end address is: 4 (R1)
; temp end address is: 0 (R0)
; temp start address is: 0 (R0)
; hum start address is: 8 (R2)
; pres start address is: 12 (R3)
; dist start address is: 16 (R4)
;uart.c,280 :: 		uint8_t url[150] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
ADD	R11, SP, #48
ADD	R10, R11, #150
MOVW	R12, #lo_addr(?ICSsendData_url_L0+0)
MOVT	R12, #hi_addr(?ICSsendData_url_L0+0)
BL	___CC2DW+0
;uart.c,281 :: 		len = strlen(url);
ADD	R4, SP, #48
MOV	R0, R4
BL	_strlen+0
; len start address is: 32 (R8)
SXTH	R8, R0
;uart.c,282 :: 		FloatToStr(temp, txtTemp);
ADD	R4, SP, #8
MOV	R0, R4
; temp end address is: 0 (R0)
BL	_FloatToStr+0
;uart.c,283 :: 		FloatToStr(hum, txtHum);
ADD	R4, SP, #18
MOV	R0, R4
VMOV.F32	S0, S2
; hum end address is: 8 (R2)
BL	_FloatToStr+0
;uart.c,284 :: 		FloatToStr(pres, txtPres);
ADD	R4, SP, #28
MOV	R0, R4
VMOV.F32	S0, S3
; pres end address is: 12 (R3)
BL	_FloatToStr+0
;uart.c,285 :: 		FloatToStr(dist, txtDist);
ADD	R4, SP, #38
MOV	R0, R4
VMOV.F32	S0, S4
; dist end address is: 16 (R4)
BL	_FloatToStr+0
;uart.c,286 :: 		for (i = 0; i < strlen(txtTemp); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 32 (R8)
; i end address is: 24 (R6)
MOV	R7, R8
L_sendData64:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #8
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData65
;uart.c,287 :: 		if (txtTemp[i] == '\0')
ADD	R4, SP, #8
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData67
; i end address is: 24 (R6)
;uart.c,288 :: 		break;
IT	AL
BAL	L_sendData65
L_sendData67:
;uart.c,289 :: 		url[len++] = txtTemp[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #8
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,286 :: 		for (i = 0; i < strlen(txtTemp); i++) {
ADDS	R6, R6, #1
;uart.c,290 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData64
L_sendData65:
;uart.c,292 :: 		url[len++] = '&';url[len++] = 'h';url[len++] = 'u';url[len++] = 'm';url[len++] = '=';
ADD	R6, SP, #48
ADDS	R5, R6, R7
MOVS	R4, #38
STRB	R4, [R5, #0]
ADDS	R4, R7, #1
; len end address is: 28 (R7)
; len start address is: 0 (R0)
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #104
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #117
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #109
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #61
STRB	R4, [R5, #0]
ADDS	R7, R0, #1
; len end address is: 0 (R0)
; len start address is: 28 (R7)
;uart.c,294 :: 		for (i = 0; i < strlen(txtHum); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 28 (R7)
; i end address is: 24 (R6)
L_sendData68:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #18
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData69
;uart.c,295 :: 		if (txtHum[i] == '\0')
ADD	R4, SP, #18
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData71
; i end address is: 24 (R6)
;uart.c,296 :: 		break;
IT	AL
BAL	L_sendData69
L_sendData71:
;uart.c,297 :: 		url[len++] = txtHum[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #18
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,294 :: 		for (i = 0; i < strlen(txtHum); i++) {
ADDS	R6, R6, #1
;uart.c,298 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData68
L_sendData69:
;uart.c,300 :: 		url[len++] = '&';url[len++] = 'p';url[len++] = 'r';url[len++] = 'e';url[len++] = 's';url[len++] = '=';
ADD	R6, SP, #48
ADDS	R5, R6, R7
MOVS	R4, #38
STRB	R4, [R5, #0]
ADDS	R4, R7, #1
; len end address is: 28 (R7)
; len start address is: 0 (R0)
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #112
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #114
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #101
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #115
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #61
STRB	R4, [R5, #0]
ADDS	R7, R0, #1
; len end address is: 0 (R0)
; len start address is: 28 (R7)
;uart.c,302 :: 		for (i = 0; i < strlen(txtPres); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 28 (R7)
; i end address is: 24 (R6)
L_sendData72:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #28
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData73
;uart.c,303 :: 		if (txtPres[i] == '\0')
ADD	R4, SP, #28
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData75
; i end address is: 24 (R6)
;uart.c,304 :: 		break;
IT	AL
BAL	L_sendData73
L_sendData75:
;uart.c,305 :: 		url[len++] = txtPres[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #28
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,302 :: 		for (i = 0; i < strlen(txtPres); i++) {
ADDS	R6, R6, #1
;uart.c,306 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData72
L_sendData73:
;uart.c,308 :: 		url[len++] = '&';url[len++] = 'd';url[len++] = 'i';url[len++] = 's';url[len++] = 't';url[len++] = '=';
ADD	R6, SP, #48
ADDS	R5, R6, R7
MOVS	R4, #38
STRB	R4, [R5, #0]
ADDS	R4, R7, #1
; len end address is: 28 (R7)
; len start address is: 0 (R0)
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #100
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #105
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #115
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #116
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #61
STRB	R4, [R5, #0]
ADDS	R1, R0, #1
; len end address is: 0 (R0)
; len start address is: 4 (R1)
;uart.c,310 :: 		for (i = 0; i < strlen(txtDist); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 4 (R1)
; i end address is: 24 (R6)
L_sendData76:
; i start address is: 24 (R6)
; len start address is: 4 (R1)
ADD	R4, SP, #38
STR	R1, [SP, #4]
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #4]
CMP	R6, R0
IT	CS
BCS	L_sendData77
;uart.c,311 :: 		if (txtDist[i] == '\0')
ADD	R4, SP, #38
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData79
; i end address is: 24 (R6)
;uart.c,312 :: 		break;
IT	AL
BAL	L_sendData77
L_sendData79:
;uart.c,313 :: 		url[len++] = txtDist[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R1
ADD	R4, SP, #38
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R1, R1, #1
;uart.c,310 :: 		for (i = 0; i < strlen(txtDist); i++) {
ADDS	R6, R6, #1
;uart.c,314 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData76
L_sendData77:
;uart.c,315 :: 		url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';
ADD	R6, SP, #48
ADDS	R5, R6, R1
MOVS	R4, #34
STRB	R4, [R5, #0]
ADDS	R4, R1, #1
; len end address is: 4 (R1)
; len start address is: 0 (R0)
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #13
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
MOV	R0, R4
ADDS	R5, R6, R4
MOVS	R4, #10
STRB	R4, [R5, #0]
ADDS	R4, R0, #1
; len end address is: 0 (R0)
ADDS	R5, R6, R4
MOVS	R4, #0
STRB	R4, [R5, #0]
;uart.c,317 :: 		USART2_Send_Text("AT+CPIN?\r\n");
MOVW	R4, #lo_addr(?lstr12_uart+0)
MOVT	R4, #hi_addr(?lstr12_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,318 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,319 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData80
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData80:
;uart.c,320 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R4, #lo_addr(?lstr13_uart+0)
MOVT	R4, #hi_addr(?lstr13_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,321 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,322 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData81
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData81:
;uart.c,324 :: 		USART2_Send_Text("AT+CGATT=1\r\n");
MOVW	R4, #lo_addr(?lstr14_uart+0)
MOVT	R4, #hi_addr(?lstr14_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,325 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,326 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData82
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData82:
;uart.c,328 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
MOVW	R4, #lo_addr(?lstr15_uart+0)
MOVT	R4, #hi_addr(?lstr15_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,329 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,330 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData83
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData83:
;uart.c,332 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n"); // telenor
MOVW	R4, #lo_addr(?lstr16_uart+0)
MOVT	R4, #hi_addr(?lstr16_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,334 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,335 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData84
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData84:
;uart.c,337 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n"); // telenor
MOVW	R4, #lo_addr(?lstr17_uart+0)
MOVT	R4, #hi_addr(?lstr17_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,339 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,340 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData85
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData85:
;uart.c,342 :: 		USART2_Send_Text("AT+SAPBR=1,1\r\n");
MOVW	R4, #lo_addr(?lstr18_uart+0)
MOVT	R4, #hi_addr(?lstr18_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,343 :: 		my_Delay_ms(3*_TIMER_UART);
MOVW	R0, #9000
BL	_my_Delay_ms+0
;uart.c,344 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData86
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData86:
;uart.c,346 :: 		USART2_Send_Text("AT+HTTPTERM\r\n");
MOVW	R4, #lo_addr(?lstr19_uart+0)
MOVT	R4, #hi_addr(?lstr19_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,347 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,348 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,350 :: 		USART2_Send_Text("AT+HTTPINIT\r\n");
MOVW	R4, #lo_addr(?lstr20_uart+0)
MOVT	R4, #hi_addr(?lstr20_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,351 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,352 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData87
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData87:
;uart.c,354 :: 		USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
MOVW	R4, #lo_addr(?lstr21_uart+0)
MOVT	R4, #hi_addr(?lstr21_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,355 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,356 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData88
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData88:
;uart.c,358 :: 		USART2_Send_Text(url);
ADD	R4, SP, #48
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,359 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,360 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData89
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData89:
;uart.c,362 :: 		USART2_Send_Text("AT+HTTPACTION=1\r\n");
MOVW	R4, #lo_addr(?lstr22_uart+0)
MOVT	R4, #hi_addr(?lstr22_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,363 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,364 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData90
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData90:
;uart.c,366 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R4, #lo_addr(?lstr23_uart+0)
MOVT	R4, #hi_addr(?lstr23_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,367 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,368 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,370 :: 		USART2_Send_Text("AT+SAPBR=0,1\r\n");
MOVW	R4, #lo_addr(?lstr24_uart+0)
MOVT	R4, #hi_addr(?lstr24_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,371 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,372 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,374 :: 		USART2_Send_Text("AT+CGATT=0\r\n");
MOVW	R4, #lo_addr(?lstr25_uart+0)
MOVT	R4, #hi_addr(?lstr25_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,375 :: 		my_Delay_ms(3*_TIMER_UART);
MOVW	R0, #9000
BL	_my_Delay_ms+0
;uart.c,376 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,378 :: 		return 1;
MOVS	R0, #1
;uart.c,379 :: 		}
L_end_sendData:
LDR	LR, [SP, #0]
ADD	SP, SP, #200
BX	LR
; end of _sendData
