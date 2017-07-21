_showTempLCD:
SUB	SP, SP, #48
STR	LR, [SP, #0]
BL	_Lcd_Init+0
MOVS	R0, #100
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVS	R0, #1
BL	_Lcd_Cmd+0
MOVS	R0, #12
BL	_Lcd_Cmd+0
ADD	R4, SP, #4
MOV	R0, R4
VLDR	#1, S0, [SP, #48]
BL	_FloatToStr+0
ADD	R4, SP, #19
MOV	R0, R4
VLDR	#1, S0, [SP, #52]
BL	_FloatToStr+0
MOVS	R0, #84
STRB	R0, [SP, #34]
MOVS	R0, #101
STRB	R0, [SP, #35]
MOVS	R0, #109
STRB	R0, [SP, #36]
MOVS	R0, #112
STRB	R0, [SP, #37]
MOVS	R0, #58
STRB	R0, [SP, #38]
MOVS	R0, #0
STRB	R0, [SP, #39]
ADD	R0, SP, #34
MOV	R4, R0
MOV	R2, R4
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVS	R0, #72
STRB	R0, [SP, #40]
MOVS	R0, #117
STRB	R0, [SP, #41]
MOVS	R0, #109
STRB	R0, [SP, #42]
MOVS	R0, #58
STRB	R0, [SP, #43]
MOVS	R0, #0
STRB	R0, [SP, #44]
ADD	R0, SP, #40
MOV	R4, R0
MOV	R2, R4
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
ADD	R4, SP, #4
MOV	R2, R4
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
ADD	R4, SP, #19
MOV	R2, R4
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
L_end_showTempLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #48
BX	LR
; end of _showTempLCD
_initLCD:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
MOVW	R1, #3072
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_end_initLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initLCD
