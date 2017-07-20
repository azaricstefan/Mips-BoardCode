_showTempLCD:
L_end_showTempLCD:
BX	LR
; end of _showTempLCD
_initLCD:
SUB	SP, SP, #16
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
BL	_Lcd_Init+0
MOVS	R0, #100
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVS	R0, #1
BL	_Lcd_Cmd+0
MOVS	R0, #12
BL	_Lcd_Cmd+0
ADD	R11, SP, #4
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr1_lcd+0)
MOVT	R12, #hi_addr(?ICS?lstr1_lcd+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R4, R0
MOV	R2, R4
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
L_end_initLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _initLCD
