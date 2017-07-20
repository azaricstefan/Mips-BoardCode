_initProg:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVW	R1, #36864
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
BL	_InitTimerUs+0
BL	_InitTimerMs+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
BL	_initLCD+0
BL	_USART2_Init+0
MOVW	R0, #lo_addr(_dist+0)
MOVT	R0, #hi_addr(_dist+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
MOVW	R0, #lo_addr(_press+0)
MOVT	R0, #hi_addr(_press+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
MOVW	R0, #lo_addr(_hum+0)
MOVT	R0, #hi_addr(_hum+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
BL	_sendData+0
ADD	SP, SP, #16
MOVW	R1, #lo_addr(_ok+0)
MOVT	R1, #hi_addr(_ok+0)
STRB	R0, [R1, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VPUSH	#0, (S0)
VPUSH	#0, (S0)
BL	_showTempLCD+0
ADD	SP, SP, #8
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
L_end_initProg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initProg
_main:
BL	_initProg+0
L_main0:
WFI
IT	AL
BAL	L_main0
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
