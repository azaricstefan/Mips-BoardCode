_USART2_Init:
;uart.c,9 :: 		void USART2_Init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,12 :: 		RCC_AHB1ENR |= _GPIOD_CLOCK_ENABLE; //Enable PORTD Clock
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,13 :: 		RCC_APB1ENR |= _USART_CLOCK_ENABLE; //Enable USART Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,14 :: 		my_Delay_ms(_UART_INIT_DELAY);
MOVS	R0, #10
BL	_my_Delay_ms+0
;uart.c,17 :: 		GPIOD_MODER |= _GPIOD_PIN6_MODE_AF | _GPIOD_PIN5_MODE_AF; //GPIOD Mode: Alternate Function
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #10240
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
;uart.c,18 :: 		GPIOD_OSPEEDR |= _GPIOD_PIN6_OSPEED_VERYHIGH | _GPIOD_PIN5_OSPEED_VERYHIGH; //GPIOD OSpeed: Very High Speed
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #15360
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,19 :: 		GPIOD_AFRL |= _GPIOD_PIN6_AF_USART2 | _GPIOD_PIN5_AF_USART2; //GPIOD AlternateFunction: USART2
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #124780544
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
STR	R1, [R0, #0]
;uart.c,20 :: 		NVIC_IPR9 |= _NVIC_INT_USART2_PRIORITY_0;
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
STR	R1, [R0, #0]
;uart.c,21 :: 		NVIC_ISER1 |= _NVIC_INT_USART2;
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
STR	R1, [R0, #0]
;uart.c,22 :: 		USART2_BRR |= _USART_BAUD_RATE;
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
LDR	R1, [R0, #0]
MOVW	R0, #3125
MOVT	R0, #0
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;uart.c,23 :: 		USART2_CR1 |= _USART_ENABLE | _USART_RXNEIE | _USART_TE | _USART_RE;
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8236
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,24 :: 		my_Delay_ms(_UART_INIT_DELAY);
MOVS	R0, #10
BL	_my_Delay_ms+0
;uart.c,25 :: 		NVIC_SetIntPriority(IVT_INT_USART2, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #54
BL	_NVIC_SetIntPriority+0
;uart.c,28 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,29 :: 		receiveUART.bufferPointerWrite = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,30 :: 		receiveUART.bufferPointerRead = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
;uart.c,31 :: 		receiveUART.msgCount=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,32 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,33 :: 		transmitUART.byteCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,34 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,35 :: 		}
L_end_USART2_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_Init
_interruptUART:
;uart.c,37 :: 		void interruptUART() iv IVT_INT_USART2 ics ICS_AUTO
;uart.c,40 :: 		usartStatusRegister = USART2_SR;
MOVW	R0, #lo_addr(USART2_SR+0)
MOVT	R0, #hi_addr(USART2_SR+0)
; usartStatusRegister start address is: 8 (R2)
LDR	R2, [R0, #0]
;uart.c,42 :: 		if(usartStatusRegister & _USART_SR_RXNE)
AND	R0, R2, #32
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART0
;uart.c,44 :: 		receiveUART.flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,45 :: 		usartDataRegister = USART2_DR;
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
; usartDataRegister start address is: 12 (R3)
LDR	R3, [R0, #0]
;uart.c,46 :: 		receiveUART.buffer[receiveUART.bufferPointerWrite] = usartDataRegister;
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+8)
MOVT	R0, #hi_addr(_receiveUART+8)
ADDS	R0, R0, R1
STRB	R3, [R0, #0]
;uart.c,47 :: 		receiveUART.bufferPointerWrite++;
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
;uart.c,48 :: 		if(receiveUART.bufferPointerWrite==1000)
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_interruptUART1
;uart.c,49 :: 		receiveUART.bufferPointerWrite=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
L_interruptUART1:
;uart.c,50 :: 		if(usartDataRegister==0x0A)
CMP	R3, #10
IT	NE
BNE	L_interruptUART2
; usartDataRegister end address is: 12 (R3)
;uart.c,52 :: 		receiveUART.msgCount++;
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
;uart.c,53 :: 		receiveUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
;uart.c,54 :: 		}
L_interruptUART2:
;uart.c,55 :: 		}
L_interruptUART0:
;uart.c,57 :: 		if(usartStatusRegister & _USART_SR_TXE)
AND	R0, R2, #128
; usartStatusRegister end address is: 8 (R2)
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART3
;uart.c,59 :: 		if(transmitUART.bufferPointer < transmitUART.byteCount)
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_interruptUART4
;uart.c,60 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
;uart.c,63 :: 		USART2_CR1 &= ~(_USART_TXEIE);
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #128
ANDS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
;uart.c,64 :: 		transmitUART.byteCount=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
;uart.c,65 :: 		transmitUART.bufferPointer = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
;uart.c,66 :: 		transmitUART.flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
;uart.c,67 :: 		}
L_interruptUART5:
;uart.c,68 :: 		}
L_interruptUART3:
;uart.c,69 :: 		}
L_end_interruptUART:
BX	LR
; end of _interruptUART
_USART2_Receive:
;uart.c,71 :: 		void USART2_Receive()
;uart.c,74 :: 		if(receiveUART.msgCount>0)
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_USART2_Receive6
;uart.c,76 :: 		current=0;
; current start address is: 12 (R3)
MOVS	R3, #0
;uart.c,77 :: 		receiveUART.msgCount--;
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
; current end address is: 12 (R3)
;uart.c,78 :: 		while(receiveUART.buffer[receiveUART.bufferPointerRead]!=0x0A)
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
;uart.c,80 :: 		receivedTxt[current]=receiveUART.buffer[receiveUART.bufferPointerRead++];
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
;uart.c,81 :: 		current++;
ADDS	R3, R3, #1
;uart.c,82 :: 		if(receiveUART.bufferPointerRead==1000)
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive9
;uart.c,83 :: 		receiveUART.bufferPointerRead=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive9:
;uart.c,84 :: 		}
IT	AL
BAL	L_USART2_Receive7
L_USART2_Receive8:
;uart.c,85 :: 		receiveUART.bufferPointerRead++;
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
;uart.c,86 :: 		if(receiveUART.bufferPointerRead==1000)
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive10
;uart.c,87 :: 		receiveUART.bufferPointerRead=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive10:
;uart.c,88 :: 		receivedTxt[current]=0;
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R1, R0, R3
; current end address is: 12 (R3)
MOVS	R0, #0
STRB	R0, [R1, #0]
;uart.c,89 :: 		receivedFlag=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
;uart.c,90 :: 		}
IT	AL
BAL	L_USART2_Receive11
L_USART2_Receive6:
;uart.c,92 :: 		receivedFlag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
L_USART2_Receive11:
;uart.c,93 :: 		}
L_end_USART2_Receive:
BX	LR
; end of _USART2_Receive
_USART2_Send_Text:
;uart.c,95 :: 		void USART2_Send_Text(uint8_t* input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
MOV	R3, R0
; input end address is: 0 (R0)
;uart.c,99 :: 		while(transmitUART.flag == 1);  //BusyWait for transmit register to get empty
L_USART2_Send_Text12:
; input start address is: 12 (R3)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send_Text13
IT	AL
BAL	L_USART2_Send_Text12
L_USART2_Send_Text13:
;uart.c,101 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,102 :: 		input_Char = *input;
LDRB	R0, [R3, #0]
; input_Char start address is: 0 (R0)
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
;uart.c,103 :: 		while((input_Char>=0x20 && input_Char<=0x7E) || input_Char==0x09 || input_Char==0x0A || input_Char==0x0D)
L_USART2_Send_Text14:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
CMP	R0, #32
IT	CC
BCC	L__USART2_Send_Text68
CMP	R0, #126
IT	HI
BHI	L__USART2_Send_Text67
IT	AL
BAL	L__USART2_Send_Text65
L__USART2_Send_Text68:
L__USART2_Send_Text67:
CMP	R0, #9
IT	EQ
BEQ	L__USART2_Send_Text71
CMP	R0, #10
IT	EQ
BEQ	L__USART2_Send_Text70
CMP	R0, #13
IT	EQ
BEQ	L__USART2_Send_Text69
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text15
L__USART2_Send_Text65:
; input_Char start address is: 0 (R0)
; input start address is: 12 (R3)
L__USART2_Send_Text71:
L__USART2_Send_Text70:
L__USART2_Send_Text69:
;uart.c,105 :: 		transmitUART.buffer[transmitUART.byteCount] = input_Char;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input_Char end address is: 0 (R0)
;uart.c,106 :: 		++input;
ADDS	R1, R3, #1
MOV	R3, R1
;uart.c,107 :: 		input_Char = *input;
LDRB	R1, [R1, #0]
; input_Char start address is: 0 (R0)
UXTB	R0, R1
;uart.c,108 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,109 :: 		}
; input end address is: 12 (R3)
; input_Char end address is: 0 (R0)
IT	AL
BAL	L_USART2_Send_Text14
L_USART2_Send_Text15:
;uart.c,111 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,113 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,114 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
;uart.c,115 :: 		USART2_CR1 |= _USART_TXEIE;
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,116 :: 		}
L_end_USART2_Send_Text:
BX	LR
; end of _USART2_Send_Text
_USART2_Send:
;uart.c,118 :: 		void USART2_Send(char input)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
; input start address is: 0 (R0)
; input end address is: 0 (R0)
;uart.c,120 :: 		while(transmitUART.flag == 1);//BusyWait for transmit register to get empty
L_USART2_Send20:
; input start address is: 0 (R0)
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_USART2_Send21
IT	AL
BAL	L_USART2_Send20
L_USART2_Send21:
;uart.c,122 :: 		transmitUART.byteCount = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,123 :: 		transmitUART.buffer[transmitUART.byteCount] = input;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_transmitUART+6)
MOVT	R1, #hi_addr(_transmitUART+6)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; input end address is: 0 (R0)
;uart.c,124 :: 		++transmitUART.byteCount;
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_transmitUART+2)
MOVT	R1, #hi_addr(_transmitUART+2)
STRH	R2, [R1, #0]
;uart.c,126 :: 		transmitUART.bufferPointer = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_transmitUART+4)
MOVT	R1, #hi_addr(_transmitUART+4)
STRH	R2, [R1, #0]
;uart.c,128 :: 		transmitUART.flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_transmitUART+0)
MOVT	R1, #hi_addr(_transmitUART+0)
STRB	R2, [R1, #0]
;uart.c,129 :: 		USART2_DR = transmitUART.buffer[transmitUART.bufferPointer++];
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
;uart.c,130 :: 		USART2_CR1 |= _USART_TXEIE;
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(USART2_CR1+0)
MOVT	R1, #hi_addr(USART2_CR1+0)
STR	R2, [R1, #0]
;uart.c,131 :: 		}
L_end_USART2_Send:
BX	LR
; end of _USART2_Send
_sendSMS:
;uart.c,134 :: 		void sendSMS() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,135 :: 		int cz = 0x1A; // Ctrl + Z
; cz start address is: 16 (R4)
MOVW	R4, #26
SXTH	R4, R4
;uart.c,136 :: 		USART2_Send_Text("AT+CMGF=1\r\n");
MOVW	R0, #lo_addr(?lstr1_uart+0)
MOVT	R0, #hi_addr(?lstr1_uart+0)
BL	_USART2_Send_Text+0
;uart.c,137 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS22:
SUBS	R7, R7, #1
BNE	L_sendSMS22
NOP
NOP
NOP
;uart.c,138 :: 		USART2_Send_Text("AT+CMGS=\"+381642914005\"\r\n");
MOVW	R0, #lo_addr(?lstr2_uart+0)
MOVT	R0, #hi_addr(?lstr2_uart+0)
BL	_USART2_Send_Text+0
;uart.c,139 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS24:
SUBS	R7, R7, #1
BNE	L_sendSMS24
NOP
NOP
NOP
;uart.c,140 :: 		USART2_Send_Text("TEST TEST");
MOVW	R0, #lo_addr(?lstr3_uart+0)
MOVT	R0, #hi_addr(?lstr3_uart+0)
BL	_USART2_Send_Text+0
;uart.c,141 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_sendSMS26:
SUBS	R7, R7, #1
BNE	L_sendSMS26
NOP
NOP
NOP
;uart.c,142 :: 		USART2_Send(cz);
UXTB	R0, R4
; cz end address is: 16 (R4)
BL	_USART2_Send+0
;uart.c,143 :: 		}
L_end_sendSMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sendSMS
_getReceiveTxt:
;uart.c,145 :: 		uint8_t getReceiveTxt()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,147 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,148 :: 		while(receivedFlag==1)
L_getReceiveTxt28:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_getReceiveTxt29
;uart.c,149 :: 		USART2_Receive();
BL	_USART2_Receive+0
IT	AL
BAL	L_getReceiveTxt28
L_getReceiveTxt29:
;uart.c,150 :: 		}
L_end_getReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getReceiveTxt
_checkReceiveTxt:
;uart.c,152 :: 		uint8_t checkReceiveTxt()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,154 :: 		uint8_t ok=0;
; ok start address is: 16 (R4)
MOVS	R4, #0
;uart.c,156 :: 		USART2_Receive();
BL	_USART2_Receive+0
; ok end address is: 16 (R4)
;uart.c,157 :: 		while(receivedFlag==1)
L_checkReceiveTxt30:
; ok start address is: 16 (R4)
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_checkReceiveTxt31
;uart.c,159 :: 		for(current=1; receivedTxt[current]!=0; current++)
; current start address is: 8 (R2)
MOVS	R2, #1
; ok end address is: 16 (R4)
; current end address is: 8 (R2)
L_checkReceiveTxt32:
; current start address is: 8 (R2)
; ok start address is: 16 (R4)
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkReceiveTxt33
;uart.c,160 :: 		if((receivedTxt[current-1]=='O')&& (receivedTxt[current]=='K'))
SUBS	R1, R2, #1
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	NE
BNE	L__checkReceiveTxt75
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	NE
BNE	L__checkReceiveTxt76
; ok end address is: 16 (R4)
L__checkReceiveTxt72:
;uart.c,161 :: 		ok=1;
; ok start address is: 0 (R0)
MOVS	R0, #1
; ok end address is: 0 (R0)
UXTB	R4, R0
;uart.c,160 :: 		if((receivedTxt[current-1]=='O')&& (receivedTxt[current]=='K'))
IT	AL
BAL	L__checkReceiveTxt74
L__checkReceiveTxt75:
L__checkReceiveTxt74:
; ok start address is: 16 (R4)
; ok end address is: 16 (R4)
IT	AL
BAL	L__checkReceiveTxt73
L__checkReceiveTxt76:
L__checkReceiveTxt73:
;uart.c,159 :: 		for(current=1; receivedTxt[current]!=0; current++)
; ok start address is: 16 (R4)
ADDS	R2, R2, #1
;uart.c,161 :: 		ok=1;
; current end address is: 8 (R2)
IT	AL
BAL	L_checkReceiveTxt32
L_checkReceiveTxt33:
;uart.c,162 :: 		USART2_Receive();
BL	_USART2_Receive+0
;uart.c,163 :: 		}
IT	AL
BAL	L_checkReceiveTxt30
L_checkReceiveTxt31:
;uart.c,164 :: 		return ok;
UXTB	R0, R4
; ok end address is: 16 (R4)
;uart.c,165 :: 		}
L_end_checkReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkReceiveTxt
_sendData:
;uart.c,167 :: 		uint8_t sendData(float temp, float hum, float pres, float dist) {
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
;uart.c,170 :: 		uint8_t url[150] = "AT+HTTPPARA=\"URL\",\"http://azaric.asuscomm.com:9998/mips/log?temp=";
ADD	R11, SP, #48
ADD	R10, R11, #150
MOVW	R12, #lo_addr(?ICSsendData_url_L0+0)
MOVT	R12, #hi_addr(?ICSsendData_url_L0+0)
BL	___CC2DW+0
;uart.c,171 :: 		len = strlen(url);
ADD	R4, SP, #48
MOV	R0, R4
BL	_strlen+0
; len start address is: 32 (R8)
SXTH	R8, R0
;uart.c,172 :: 		FloatToStr(temp, txtTemp);
ADD	R4, SP, #8
MOV	R0, R4
; temp end address is: 0 (R0)
BL	_FloatToStr+0
;uart.c,173 :: 		FloatToStr(hum, txtHum);
ADD	R4, SP, #18
MOV	R0, R4
VMOV.F32	S0, S2
; hum end address is: 8 (R2)
BL	_FloatToStr+0
;uart.c,174 :: 		FloatToStr(pres, txtPres);
ADD	R4, SP, #28
MOV	R0, R4
VMOV.F32	S0, S3
; pres end address is: 12 (R3)
BL	_FloatToStr+0
;uart.c,175 :: 		FloatToStr(dist, txtDist);
ADD	R4, SP, #38
MOV	R0, R4
VMOV.F32	S0, S4
; dist end address is: 16 (R4)
BL	_FloatToStr+0
;uart.c,176 :: 		for (i = 0; i < strlen(txtTemp); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 32 (R8)
; i end address is: 24 (R6)
MOV	R7, R8
L_sendData38:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #8
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData39
;uart.c,177 :: 		if (txtTemp[i] == '\0')
ADD	R4, SP, #8
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData41
; i end address is: 24 (R6)
;uart.c,178 :: 		break;
IT	AL
BAL	L_sendData39
L_sendData41:
;uart.c,179 :: 		url[len++] = txtTemp[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #8
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,176 :: 		for (i = 0; i < strlen(txtTemp); i++) {
ADDS	R6, R6, #1
;uart.c,180 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData38
L_sendData39:
;uart.c,182 :: 		url[len++] = '&';url[len++] = 'h';url[len++] = 'u';url[len++] = 'm';url[len++] = '=';
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
;uart.c,184 :: 		for (i = 0; i < strlen(txtHum); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 28 (R7)
; i end address is: 24 (R6)
L_sendData42:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #18
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData43
;uart.c,185 :: 		if (txtHum[i] == '\0')
ADD	R4, SP, #18
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData45
; i end address is: 24 (R6)
;uart.c,186 :: 		break;
IT	AL
BAL	L_sendData43
L_sendData45:
;uart.c,187 :: 		url[len++] = txtHum[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #18
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,184 :: 		for (i = 0; i < strlen(txtHum); i++) {
ADDS	R6, R6, #1
;uart.c,188 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData42
L_sendData43:
;uart.c,190 :: 		url[len++] = '&';url[len++] = 'p';url[len++] = 'r';url[len++] = 'e';url[len++] = 's';url[len++] = '=';
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
;uart.c,192 :: 		for (i = 0; i < strlen(txtPres); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 28 (R7)
; i end address is: 24 (R6)
L_sendData46:
; i start address is: 24 (R6)
; len start address is: 28 (R7)
ADD	R4, SP, #28
MOV	R0, R4
BL	_strlen+0
CMP	R6, R0
IT	CS
BCS	L_sendData47
;uart.c,193 :: 		if (txtPres[i] == '\0')
ADD	R4, SP, #28
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData49
; i end address is: 24 (R6)
;uart.c,194 :: 		break;
IT	AL
BAL	L_sendData47
L_sendData49:
;uart.c,195 :: 		url[len++] = txtPres[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R7
ADD	R4, SP, #28
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
;uart.c,192 :: 		for (i = 0; i < strlen(txtPres); i++) {
ADDS	R6, R6, #1
;uart.c,196 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData46
L_sendData47:
;uart.c,198 :: 		url[len++] = '&';url[len++] = 'd';url[len++] = 'i';url[len++] = 's';url[len++] = 't';url[len++] = '=';
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
;uart.c,200 :: 		for (i = 0; i < strlen(txtDist); i++) {
; i start address is: 24 (R6)
MOVS	R6, #0
; len end address is: 4 (R1)
; i end address is: 24 (R6)
L_sendData50:
; i start address is: 24 (R6)
; len start address is: 4 (R1)
ADD	R4, SP, #38
STR	R1, [SP, #4]
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #4]
CMP	R6, R0
IT	CS
BCS	L_sendData51
;uart.c,201 :: 		if (txtDist[i] == '\0')
ADD	R4, SP, #38
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_sendData53
; i end address is: 24 (R6)
;uart.c,202 :: 		break;
IT	AL
BAL	L_sendData51
L_sendData53:
;uart.c,203 :: 		url[len++] = txtDist[i];
; i start address is: 24 (R6)
ADD	R4, SP, #48
ADDS	R5, R4, R1
ADD	R4, SP, #38
ADDS	R4, R4, R6
LDRB	R4, [R4, #0]
STRB	R4, [R5, #0]
ADDS	R1, R1, #1
;uart.c,200 :: 		for (i = 0; i < strlen(txtDist); i++) {
ADDS	R6, R6, #1
;uart.c,204 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_sendData50
L_sendData51:
;uart.c,205 :: 		url[len++] = '\"';url[len++] = '\r';url[len++] = '\n';url[len++] = '\0';
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
;uart.c,207 :: 		USART2_Send_Text("AT+CPIN?\r\n");
MOVW	R4, #lo_addr(?lstr4_uart+0)
MOVT	R4, #hi_addr(?lstr4_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,208 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,209 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData54
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData54:
;uart.c,210 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R4, #lo_addr(?lstr5_uart+0)
MOVT	R4, #hi_addr(?lstr5_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,211 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,212 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData55
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData55:
;uart.c,214 :: 		USART2_Send_Text("AT+CGATT=1\r\n");
MOVW	R4, #lo_addr(?lstr6_uart+0)
MOVT	R4, #hi_addr(?lstr6_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,215 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,216 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData56
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData56:
;uart.c,218 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"\r\n");
MOVW	R4, #lo_addr(?lstr7_uart+0)
MOVT	R4, #hi_addr(?lstr7_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,219 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,220 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData57
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData57:
;uart.c,222 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"APN\",\"internet\"\r\n"); // telenor
MOVW	R4, #lo_addr(?lstr8_uart+0)
MOVT	R4, #hi_addr(?lstr8_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,224 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,225 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData58
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData58:
;uart.c,227 :: 		USART2_Send_Text("AT+SAPBR=3,1,\"PWD\",\"gprs\"\r\n"); // telenor
MOVW	R4, #lo_addr(?lstr9_uart+0)
MOVT	R4, #hi_addr(?lstr9_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,229 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,230 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData59
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData59:
;uart.c,232 :: 		USART2_Send_Text("AT+SAPBR=1,1\r\n");
MOVW	R4, #lo_addr(?lstr10_uart+0)
MOVT	R4, #hi_addr(?lstr10_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,233 :: 		my_Delay_ms(3*_TIMER_UART);
MOVW	R0, #9000
BL	_my_Delay_ms+0
;uart.c,234 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData60
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData60:
;uart.c,236 :: 		USART2_Send_Text("AT+HTTPTERM\r\n");
MOVW	R4, #lo_addr(?lstr11_uart+0)
MOVT	R4, #hi_addr(?lstr11_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,237 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,238 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,240 :: 		USART2_Send_Text("AT+HTTPINIT\r\n");
MOVW	R4, #lo_addr(?lstr12_uart+0)
MOVT	R4, #hi_addr(?lstr12_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,241 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,242 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData61
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData61:
;uart.c,244 :: 		USART2_Send_Text("AT+HTTPPARA=\"CID\",1\r\n");
MOVW	R4, #lo_addr(?lstr13_uart+0)
MOVT	R4, #hi_addr(?lstr13_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,245 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,246 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData62
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData62:
;uart.c,248 :: 		USART2_Send_Text(url);
ADD	R4, SP, #48
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,249 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,250 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData63
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData63:
;uart.c,252 :: 		USART2_Send_Text("AT+HTTPACTION=1\r\n");
MOVW	R4, #lo_addr(?lstr14_uart+0)
MOVT	R4, #hi_addr(?lstr14_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,253 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,254 :: 		if(checkReceiveTxt()==0) return 0;
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData64
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData64:
;uart.c,256 :: 		USART2_Send_Text("AT+CIPSHUT\r\n");
MOVW	R4, #lo_addr(?lstr15_uart+0)
MOVT	R4, #hi_addr(?lstr15_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,257 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,258 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,260 :: 		USART2_Send_Text("AT+SAPBR=0,1\r\n");
MOVW	R4, #lo_addr(?lstr16_uart+0)
MOVT	R4, #hi_addr(?lstr16_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,261 :: 		my_Delay_ms(_TIMER_UART);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;uart.c,262 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,264 :: 		USART2_Send_Text("AT+CGATT=0\r\n");
MOVW	R4, #lo_addr(?lstr17_uart+0)
MOVT	R4, #hi_addr(?lstr17_uart+0)
MOV	R0, R4
BL	_USART2_Send_Text+0
;uart.c,265 :: 		my_Delay_ms(3*_TIMER_UART);
MOVW	R0, #9000
BL	_my_Delay_ms+0
;uart.c,266 :: 		getReceiveTxt();
BL	_getReceiveTxt+0
;uart.c,268 :: 		return 1;
MOVS	R0, #1
;uart.c,269 :: 		}
L_end_sendData:
LDR	LR, [SP, #0]
ADD	SP, SP, #200
BX	LR
; end of _sendData
