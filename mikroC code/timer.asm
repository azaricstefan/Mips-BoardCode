_InitTimerUs:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
MOVS	R1, #59
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
MOVW	R0, #44
BL	_NVIC_IntEnable+0
MOVS	R1, #1
MOVS	R0, #44
BL	_NVIC_SetIntPriority+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
STR	R1, [R0, #0]
L_end_InitTimerUs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimerUs
_Timer2_interrupt:
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
LDR	R1, [R0, #0]
MOVW	R0, #51712
MOVT	R0, #15258
CMP	R1, R0
IT	CS
BCS	L_Timer2_interrupt0
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
STR	R1, [R0, #0]
L_Timer2_interrupt0:
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_my_Delay_us:
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
STR	R1, [R0, #0]
L_my_Delay_us1:
LDR	R1, [SP, #0]
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_my_Delay_us2
IT	AL
BAL	L_my_Delay_us1
L_my_Delay_us2:
L_end_my_Delay_us:
BX	LR
; end of _my_Delay_us
_InitTimerMs:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
MOVW	R0, #45
BL	_NVIC_IntEnable+0
MOVS	R1, #1
MOVS	R0, #45
BL	_NVIC_SetIntPriority+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
L_end_InitTimerMs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimerMs
_Timer3_interrupt:
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
LDR	R1, [R0, #0]
MOVW	R0, #51712
MOVT	R0, #15258
CMP	R1, R0
IT	CS
BCS	L_Timer3_interrupt3
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
STR	R1, [R0, #0]
L_Timer3_interrupt3:
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
_my_Delay_ms:
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
STR	R1, [R0, #0]
L_my_Delay_ms4:
LDR	R1, [SP, #0]
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_my_Delay_ms5
IT	AL
BAL	L_my_Delay_ms4
L_my_Delay_ms5:
L_end_my_Delay_ms:
BX	LR
; end of _my_Delay_ms
_RTCInit:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
MOVS	R1, #202
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
MOVS	R1, #83
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit6
MOV	R1, #65536
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
MOVW	R1, #33025
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
L_RTCInit6:
L_RTCInit7:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit8
IT	AL
BAL	L_RTCInit7
L_RTCInit8:
L_RTCInit9:
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit10
IT	AL
BAL	L_RTCInit9
L_RTCInit10:
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R1, [R0, #0]
L_RTCInit11:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit12
IT	AL
BAL	L_RTCInit11
L_RTCInit12:
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R2, [R0, #0]
MOVS	R1, #120
MOVW	R0, #lo_addr(RTC_WUTR+0)
MOVT	R0, #hi_addr(RTC_WUTR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
L_RTCInit13:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit14
IT	AL
BAL	L_RTCInit13
L_RTCInit14:
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
MOVS	R1, #255
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #19
BL	_NVIC_IntEnable+0
MOVS	R1, #2
MOVS	R0, #19
BL	_NVIC_SetIntPriority+0
L_end_RTCInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTCInit
