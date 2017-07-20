_USART2_Init:
SUB	SP, SP, #4
STR	LR, [SP, #0]
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
L_end_USART2_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_Init
_showLCDtxt:
SUB	SP, SP, #16
STR	LR, [SP, #0]
ADD	R4, SP, #4
MOV	R1, R4
LDRSH	R0, [SP, #16]
BL	_IntToStr+0
ADD	R4, SP, #10
MOV	R1, R4
LDRSH	R0, [SP, #20]
BL	_IntToStr+0
BL	_Lcd_Init+0
MOVS	R0, #100
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVS	R0, #1
BL	_Lcd_Cmd+0
MOVS	R0, #12
BL	_Lcd_Cmd+0
MOVW	R2, #lo_addr(_receivedTxt+0)
MOVT	R2, #hi_addr(_receivedTxt+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
ADD	R4, SP, #4
MOV	R2, R4
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
ADD	R4, SP, #10
MOV	R2, R4
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
L_end_showLCDtxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _showLCDtxt
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
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVW	R0, #lo_addr(_receiveUART+2)
MOVT	R0, #hi_addr(_receiveUART+2)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_USART2_Receive6
MOVS	R0, #0
STR	R0, [SP, #4]
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
LDR	R1, [SP, #4]
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
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
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
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
MOVW	R0, #lo_addr(_receiveUART+4)
MOVT	R0, #hi_addr(_receiveUART+4)
LDRH	R0, [R0, #0]
PUSH	(R0)
LDR	R0, [SP, #8]
PUSH	(R0)
BL	_showLCDtxt+0
ADD	SP, SP, #8
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #500
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
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
LDR	LR, [SP, #0]
ADD	SP, SP, #8
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
BCC	L__USART2_Send_Text54
LDRB	R0, [SP, #0]
CMP	R0, #126
IT	HI
BHI	L__USART2_Send_Text54
IT	AL
BAL	L__USART2_Send_Text53
L__USART2_Send_Text54:
LDRB	R0, [SP, #0]
CMP	R0, #9
IT	EQ
BEQ	L__USART2_Send_Text53
LDRB	R0, [SP, #0]
CMP	R0, #10
IT	EQ
BEQ	L__USART2_Send_Text53
LDRB	R0, [SP, #0]
CMP	R0, #13
IT	EQ
BEQ	L__USART2_Send_Text53
IT	AL
BAL	L_USART2_Send_Text15
L__USART2_Send_Text53:
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
L_end_USART2_Send:
BX	LR
; end of _USART2_Send
_sendSMS:
L_end_sendSMS:
BX	LR
; end of _sendSMS
_getReceiveTxt:
SUB	SP, SP, #4
STR	LR, [SP, #0]
BL	_USART2_Receive+0
L_getReceiveTxt20:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_getReceiveTxt21
BL	_USART2_Receive+0
IT	AL
BAL	L_getReceiveTxt20
L_getReceiveTxt21:
L_end_getReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getReceiveTxt
_checkReceiveTxt:
SUB	SP, SP, #8
STR	LR, [SP, #0]
BL	_USART2_Receive+0
L_checkReceiveTxt22:
MOVW	R0, #lo_addr(_receivedFlag+0)
MOVT	R0, #hi_addr(_receivedFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_checkReceiveTxt23
MOVS	R0, #1
STR	R0, [SP, #4]
L_checkReceiveTxt24:
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkReceiveTxt25
LDR	R0, [SP, #4]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	NE
BNE	L_checkReceiveTxt29
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_receivedTxt+0)
MOVT	R0, #hi_addr(_receivedTxt+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	NE
BNE	L_checkReceiveTxt29
L__checkReceiveTxt55:
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
L_checkReceiveTxt29:
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
IT	AL
BAL	L_checkReceiveTxt24
L_checkReceiveTxt25:
BL	_USART2_Receive+0
IT	AL
BAL	L_checkReceiveTxt22
L_checkReceiveTxt23:
MOVS	R0, #1
L_end_checkReceiveTxt:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _checkReceiveTxt
_sendData:
SUB	SP, SP, #336
STR	LR, [SP, #0]
ADD	R11, SP, #184
ADD	R10, R11, #150
MOVW	R12, #lo_addr(?ICSsendData_url_L0+0)
MOVT	R12, #hi_addr(?ICSsendData_url_L0+0)
BL	___CC2DW+0
ADD	R4, SP, #184
MOV	R0, R4
BL	_strlen+0
STR	R0, [SP, #4]
ADD	R4, SP, #12
MOV	R0, R4
VLDR	#1, S0, [SP, #336]
BL	_FloatToStr+0
ADD	R4, SP, #22
MOV	R0, R4
VLDR	#1, S0, [SP, #340]
BL	_FloatToStr+0
ADD	R4, SP, #32
MOV	R0, R4
VLDR	#1, S0, [SP, #344]
BL	_FloatToStr+0
ADD	R4, SP, #42
MOV	R0, R4
VLDR	#1, S0, [SP, #348]
BL	_FloatToStr+0
MOVS	R0, #0
STR	R0, [SP, #8]
L_sendData30:
ADD	R4, SP, #12
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData31
ADD	R1, SP, #12
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData33
IT	AL
BAL	L_sendData31
L_sendData33:
ADD	R1, SP, #184
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
BAL	L_sendData30
L_sendData31:
ADD	R2, SP, #184
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
L_sendData34:
ADD	R4, SP, #22
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData35
ADD	R1, SP, #22
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData37
IT	AL
BAL	L_sendData35
L_sendData37:
ADD	R1, SP, #184
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
BAL	L_sendData34
L_sendData35:
ADD	R2, SP, #184
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
L_sendData38:
ADD	R4, SP, #32
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData39
ADD	R1, SP, #32
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData41
IT	AL
BAL	L_sendData39
L_sendData41:
ADD	R1, SP, #184
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
BAL	L_sendData38
L_sendData39:
ADD	R2, SP, #184
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
L_sendData42:
ADD	R4, SP, #42
MOV	R0, R4
BL	_strlen+0
LDR	R1, [SP, #8]
CMP	R1, R0
IT	CS
BCS	L_sendData43
ADD	R1, SP, #42
LDR	R0, [SP, #8]
ADDS	R0, R1, R0
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_sendData45
IT	AL
BAL	L_sendData43
L_sendData45:
ADD	R1, SP, #184
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
BAL	L_sendData42
L_sendData43:
ADD	R2, SP, #184
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
MOVS	R0, #65
STRB	R0, [SP, #52]
MOVS	R0, #84
STRB	R0, [SP, #53]
MOVS	R0, #13
STRB	R0, [SP, #54]
MOVS	R0, #10
STRB	R0, [SP, #55]
MOVS	R0, #0
STRB	R0, [SP, #56]
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
BNE	L_sendData46
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData46:
ADD	R11, SP, #57
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr2_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr2_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #57
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
BNE	L_sendData47
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData47:
ADD	R11, SP, #68
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr3_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr3_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #68
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
BNE	L_sendData48
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData48:
ADD	R11, SP, #81
ADD	R10, R11, #13
MOVW	R12, #lo_addr(?ICS?lstr4_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr4_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #81
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
BNE	L_sendData49
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData49:
ADD	R11, SP, #94
ADD	R10, R11, #32
MOVW	R12, #lo_addr(?ICS?lstr5_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr5_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #94
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
BNE	L_sendData50
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData50:
ADD	R11, SP, #126
ADD	R10, R11, #31
MOVW	R12, #lo_addr(?ICS?lstr6_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr6_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #126
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
BNE	L_sendData51
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData51:
ADD	R11, SP, #157
ADD	R10, R11, #27
MOVW	R12, #lo_addr(?ICS?lstr7_uart+0)
MOVT	R12, #hi_addr(?ICS?lstr7_uart+0)
BL	___CC2DW+0
ADD	R0, SP, #157
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
BNE	L_sendData52
MOVS	R0, #0
IT	AL
BAL	L_end_sendData
L_sendData52:
MOVS	R0, #1
L_end_sendData:
LDR	LR, [SP, #0]
ADD	SP, SP, #336
BX	LR
; end of _sendData
