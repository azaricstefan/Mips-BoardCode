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
BL	_RTCInit+0
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
_interRTC:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R2, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R2, [R0, #0]
L_interRTC0:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interRTC1
IT	AL
BAL	L_interRTC0
L_interRTC1:
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVS	R1, #10
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
STRB	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_hum+0)
MOVT	R0, #hi_addr(_hum+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
VLDR	#1, S0, [R0, #0]
VPUSH	#0, (S0)
BL	_showTempLCD+0
ADD	SP, SP, #8
MOVS	R1, #0
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
STRB	R1, [R0, #0]
L_interRTC2:
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interRTC3
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_interRTC3
L__interRTC8:
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
MOVW	R1, #lo_addr(_cnt+0)
MOVT	R1, #hi_addr(_cnt+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
IT	AL
BAL	L_interRTC2
L_interRTC3:
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
L_end_interRTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interRTC
_main:
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
BL	_initProg+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
L_main6:
WFI
IT	AL
BAL	L_main6
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
