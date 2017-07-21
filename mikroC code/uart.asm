_USART2_Init:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
MOVS	R0, #10
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #10240
MOVW	R0, #lo_addr(GPIOD_MODER+0)
MOVT	R0, #hi_addr(GPIOD_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #15360
MOVW	R0, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOD_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #124780544
MOVW	R0, #lo_addr(GPIOD_AFRL+0)
MOVT	R0, #hi_addr(GPIOD_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_IPR9+0)
MOVT	R0, #hi_addr(NVIC_IPR9+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(NVIC_ISER1+0)
MOVT	R0, #hi_addr(NVIC_ISER1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
LDR	R1, [R0, #0]
MOVW	R0, #3125
MOVT	R0, #0
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8236
ORRS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
MOVS	R0, #10
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVS	R1, #0
MOVS	R0, #54
BL	_NVIC_SetIntPriority+0
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
L_end_USART2_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_Init
_interruptUART:
SUB	SP, SP, #8
MOVW	R0, #lo_addr(USART2_SR+0)
MOVT	R0, #hi_addr(USART2_SR+0)
LDR	R0, [R0, #0]
STR	R0, [SP, #0]
LDR	R0, [SP, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART0
MOVS	R1, #1
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
LDR	R0, [R0, #0]
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+8)
MOVT	R0, #hi_addr(_receiveUART+8)
ADDS	R1, R0, R1
LDR	R0, [SP, #4]
STRB	R0, [R1, #0]
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_interruptUART1
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
STRH	R1, [R0, #0]
L_interruptUART1:
LDR	R0, [SP, #4]
CMP	R0, #10
IT	NE
BNE	L_interruptUART2
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+0)
MOVT	R0, #hi_addr(_receiveUART+0)
STRB	R1, [R0, #0]
L_interruptUART2:
L_interruptUART0:
LDR	R0, [SP, #0]
AND	R0, R0, #128
CMP	R0, #0
IT	EQ
BEQ	L_interruptUART3
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_interruptUART4
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
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #128
ANDS	R1, R0
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
L_interruptUART5:
L_interruptUART3:
L_end_interruptUART:
ADD	SP, SP, #8
BX	LR
; end of _interruptUART
_USART2_Receive:
SUB	SP, SP, #4
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_USART2_Receive6
MOVS	R0, #0
STR	R0, [SP, #0]
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
STRH	R1, [R0, #0]
L_USART2_Receive7:
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
LDR	R1, [SP, #0]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R2, R0, R1
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
LDR	R0, [SP, #0]
ADDS	R0, R0, #1
STR	R0, [SP, #0]
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive9
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive9:
IT	AL
BAL	L_USART2_Receive7
L_USART2_Receive8:
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
LDRH	R0, [R0, #0]
CMP	R0, #1000
IT	NE
BNE	L_USART2_Receive10
MOVS	R1, #0
MOVW	R0, #lo_addr(_receiveUART+6)
MOVT	R0, #hi_addr(_receiveUART+6)
STRH	R1, [R0, #0]
L_USART2_Receive10:
LDR	R1, [SP, #0]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_USART2_Receive11
L_USART2_Receive6:
MOVS	R1, #0
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
STRB	R1, [R0, #0]
L_USART2_Receive11:
L_end_USART2_Receive:
ADD	SP, SP, #4
BX	LR
; end of _USART2_Receive
_USART2_Send_Text:
SUB	SP, SP, #4
L_USART2_Send_Text12:
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_USART2_Send_Text13
IT	AL
BAL	L_USART2_Send_Text12
L_USART2_Send_Text13:
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
LDR	R0, [SP, #4]
LDRB	R0, [R0, #0]
STRB	R0, [SP, #0]
L_USART2_Send_Text14:
LDRB	R0, [SP, #0]
CMP	R0, #32
IT	CC
BCC	L__USART2_Send_Text69
LDRB	R0, [SP, #0]
CMP	R0, #126
IT	HI
BHI	L__USART2_Send_Text69
IT	AL
BAL	L__USART2_Send_Text68
L__USART2_Send_Text69:
LDRB	R0, [SP, #0]
CMP	R0, #9
IT	EQ
BEQ	L__USART2_Send_Text68
LDRB	R0, [SP, #0]
CMP	R0, #10
IT	EQ
BEQ	L__USART2_Send_Text68
LDRB	R0, [SP, #0]
CMP	R0, #13
IT	EQ
BEQ	L__USART2_Send_Text68
IT	AL
BAL	L_USART2_Send_Text15
L__USART2_Send_Text68:
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R1, R0, R1
LDRB	R0, [SP, #0]
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDRB	R0, [R0, #0]
STRB	R0, [SP, #0]
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
IT	AL
BAL	L_USART2_Send_Text14
L_USART2_Send_Text15:
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
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
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
L_end_USART2_Send_Text:
ADD	SP, SP, #4
BX	LR
; end of _USART2_Send_Text
_USART2_Send:
L_USART2_Send20:
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_USART2_Send21
IT	AL
BAL	L_USART2_Send20
L_USART2_Send21:
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_transmitUART+6)
MOVT	R0, #hi_addr(_transmitUART+6)
ADDS	R1, R0, R1
LDRB	R0, [SP, #0]
STRB	R0, [R1, #0]
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_transmitUART+2)
MOVT	R0, #hi_addr(_transmitUART+2)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_transmitUART+4)
MOVT	R0, #hi_addr(_transmitUART+4)
STRH	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(_transmitUART+0)
MOVT	R0, #hi_addr(_transmitUART+0)
STRB	R1, [R0, #0]
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
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(USART2_CR1+0)
MOVT	R0, #hi_addr(USART2_CR1+0)
STR	R1, [R0, #0]
L_end_USART2_Send:
BX	LR
; end of _USART2_Send
_sendSMS:
SUB	SP, SP, #56
STR	LR, [SP, #0]
MOVW	R0, #26
STRH	R0, [SP, #52]
ADD	R11, SP, #4
ADD	R10, R11, #12
MOVW	R12, #lo_addr(?ICS?lstr1_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr1_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #4
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
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
ADD	R11, SP, #16
ADD	R10, R11, #26
MOVW	R12, #lo_addr(?ICS?lstr2_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr2_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #16
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
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
ADD	R11, SP, #42
ADD	R10, R11, #10
MOVW	R12, #lo_addr(?ICS?lstr3_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr3_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #42
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
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
LDRSH	R0, [SP, #52]
PUSH	(R0)
BL	_USART2_Send+0
ADD	SP, SP, #4
L_end_sendSMS:
LDR	LR, [SP, #0]
ADD	SP, SP, #56
BX	LR
; end of _sendSMS
_getReceiveTxt:
SUB	SP, SP, #4
STR	LR, [SP, #0]
BL	_USART2_Receive+0
L_getReceiveTxt28:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_getReceiveTxt29
BL	_USART2_Receive+0
IT	AL
BAL	L_getReceiveTxt28
L_getReceiveTxt29:
L_end_getReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getReceiveTxt
_checkReceiveTxt:
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOVS	R0, #0
STRB	R0, [SP, #8]
BL	_USART2_Receive+0
L_checkReceiveTxt30:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_checkReceiveTxt31
MOVS	R0, #1
STR	R0, [SP, #4]
L_checkReceiveTxt32:
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkReceiveTxt33
LDR	R0, [SP, #4]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	NE
BNE	L_checkReceiveTxt37
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	NE
BNE	L_checkReceiveTxt37
L__checkReceiveTxt70:
MOVS	R0, #1
STRB	R0, [SP, #8]
L_checkReceiveTxt37:
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
IT	AL
BAL	L_checkReceiveTxt32
L_checkReceiveTxt33:
BL	_USART2_Receive+0
IT	AL
BAL	L_checkReceiveTxt30
L_checkReceiveTxt31:
LDRB	R0, [SP, #8]
L_end_checkReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _checkReceiveTxt
_sendData:
SUB	SP, SP, #456
STR	LR, [SP, #0]
ADDW	R11, SP, #303
ADD	R10, R11, #150
MOVW	R12, #lo_addr(?ICSsendData_url_L0+0)
MOVT	R12, #hi_addr(?ICSsendData_url_L0+0)
BL	___CC2DW+0
ADDW	R4, SP, #303
MOV	R0, R4
BL	_strlen+0
STR	R0, [SP, #4]
ADD	R4, SP, #12
MOV	R0, R4
VLDR	#1, S0, [SP, #456]
BL	_FloatToStr+0
ADD	R4, SP, #22
MOV	R0, R4
VLDR	#1, S0, [SP, #460]
BL	_FloatToStr+0
ADD	R4, SP, #32
MOV	R0, R4
VLDR	#1, S0, [SP, #464]
BL	_FloatToStr+0
ADD	R4, SP, #42
MOV	R0, R4
VLDR	#1, S0, [SP, #468]
BL	_FloatToStr+0
MOVS	R0, #0
STR	R0, [SP, #8]
L_sendData38:
ADD	R4, SP, #12
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData39
ADD	R1, SP, #12
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData41
IT	AL
BAL	L_sendData39
L_sendData41:
ADDW	R1, SP, #303
LDR	R0, [SP, #4]
ADDS	R2, R1, R0
ADD	R1, SP, #12
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
IT	AL
BAL	L_sendData38
L_sendData39:
ADDW	R2, SP, #303
LDR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #38
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #104
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #117
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #109
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #61
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
MOVS	R0, #0
STR	R0, [SP, #8]
L_sendData42:
ADD	R4, SP, #22
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData43
ADD	R1, SP, #22
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData45
IT	AL
BAL	L_sendData43
L_sendData45:
ADDW	R1, SP, #303
LDR	R0, [SP, #4]
ADDS	R2, R1, R0
ADD	R1, SP, #22
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
IT	AL
BAL	L_sendData42
L_sendData43:
ADDW	R2, SP, #303
LDR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #38
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #112
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #114
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #101
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #115
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #61
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
MOVS	R0, #0
STR	R0, [SP, #8]
L_sendData46:
ADD	R4, SP, #32
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData47
ADD	R1, SP, #32
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData49
IT	AL
BAL	L_sendData47
L_sendData49:
ADDW	R1, SP, #303
LDR	R0, [SP, #4]
ADDS	R2, R1, R0
ADD	R1, SP, #32
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
IT	AL
BAL	L_sendData46
L_sendData47:
ADDW	R2, SP, #303
LDR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #38
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #100
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #105
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #115
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #116
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #61
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
MOVS	R0, #0
STR	R0, [SP, #8]
L_sendData50:
ADD	R4, SP, #42
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData51
ADD	R1, SP, #42
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData53
IT	AL
BAL	L_sendData51
L_sendData53:
ADDW	R1, SP, #303
LDR	R0, [SP, #4]
ADDS	R2, R1, R0
ADD	R1, SP, #42
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
IT	AL
BAL	L_sendData50
L_sendData51:
ADDW	R2, SP, #303
LDR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #34
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #13
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #10
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
ADD	R11, SP, #52
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr4_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr4_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #52
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData54
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData54:
ADD	R11, SP, #63
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr5_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr5_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #63
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData55
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData55:
ADD	R11, SP, #76
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr6_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr6_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #76
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData56
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData56:
ADD	R11, SP, #89
ADD	R10, R11, #32
MOVW	R12, #lo_addr(?ICS?lstr7_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr7_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #89
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData57
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData57:
ADD	R11, SP, #121
ADD	R10, R11, #31
MOVW	R12, #lo_addr(?ICS?lstr8_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr8_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #121
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData58
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData58:
ADD	R11, SP, #152
ADD	R10, R11, #27
MOVW	R12, #lo_addr(?ICS?lstr9_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr9_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #152
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData59
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData59:
ADD	R11, SP, #179
ADD	R10, R11, #15
MOVW	R12, #lo_addr(?ICS?lstr10_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr10_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #179
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #9000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData60
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData60:
ADD	R11, SP, #194
ADD	R10, R11, #14
MOVW	R12, #lo_addr(?ICS?lstr11_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr11_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #194
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_getReceiveTxt+0
ADD	R11, SP, #208
ADD	R10, R11, #14
MOVW	R12, #lo_addr(?ICS?lstr12_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr12_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #208
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData61
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData61:
ADD	R11, SP, #222
ADD	R10, R11, #22
MOVW	R12, #lo_addr(?ICS?lstr13_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr13_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #222
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData62
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData62:
ADDW	R0, SP, #303
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData63
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData63:
ADD	R11, SP, #244
ADD	R10, R11, #18
MOVW	R12, #lo_addr(?ICS?lstr14_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr14_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #244
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData64
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData64:
ADD	R11, SP, #262
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr15_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr15_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #262
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData65
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData65:
ADDW	R11, SP, #275
ADD	R10, R11, #15
MOVW	R12, #lo_addr(?ICS?lstr16_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr16_uart+0)
BL	___CC2DW+0
ADDW	R0, SP, #275
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #3000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData66
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData66:
ADD	R11, SP, #290
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr17_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr17_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #290
PUSH	(R0)
BL	_USART2_Send_Text+0
ADD	SP, SP, #4
MOVW	R0, #9000
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_checkReceiveTxt+0
CMP	R0, #0
IT	NE
BNE	L_sendData67
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData67:
MOVS	R0, #1
L_end_sendData:
LDR	LR, [SP, #0]
ADD	SP, SP, #456
BX	LR
; end of _sendData
