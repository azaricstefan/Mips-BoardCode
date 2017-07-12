_InitTimerUs:
;timer.c,8 :: 		void InitTimerUs(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timer.c,9 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;timer.c,10 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;timer.c,11 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;timer.c,12 :: 		TIM2_ARR = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;timer.c,13 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;timer.c,14 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;timer.c,15 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;timer.c,16 :: 		tick_us=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
STR	R1, [R0, #0]
;timer.c,17 :: 		}
L_end_InitTimerUs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimerUs
_Timer2_interrupt:
;timer.c,19 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;timer.c,20 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;timer.c,21 :: 		if(tick_us<1000000000)
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
LDR	R1, [R0, #0]
MOVW	R0, #51712
MOVT	R0, #15258
CMP	R1, R0
IT	CS
BCS	L_Timer2_interrupt0
;timer.c,22 :: 		tick_us++;
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_tick_us+0)
MOVT	R0, #hi_addr(_tick_us+0)
STR	R1, [R0, #0]
L_Timer2_interrupt0:
;timer.c,23 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_my_Delay_us:
;timer.c,25 :: 		void my_Delay_us(uint32_t num)
; num start address is: 0 (R0)
; num end address is: 0 (R0)
; num start address is: 0 (R0)
;timer.c,27 :: 		tick_us=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_tick_us+0)
MOVT	R1, #hi_addr(_tick_us+0)
STR	R2, [R1, #0]
; num end address is: 0 (R0)
;timer.c,28 :: 		while(tick_us<num);
L_my_Delay_us1:
; num start address is: 0 (R0)
MOVW	R1, #lo_addr(_tick_us+0)
MOVT	R1, #hi_addr(_tick_us+0)
LDR	R1, [R1, #0]
CMP	R1, R0
IT	CS
BCS	L_my_Delay_us2
; num end address is: 0 (R0)
IT	AL
BAL	L_my_Delay_us1
L_my_Delay_us2:
;timer.c,29 :: 		}
L_end_my_Delay_us:
BX	LR
; end of _my_Delay_us
_InitTimerMs:
;timer.c,33 :: 		void InitTimerMs(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timer.c,34 :: 		RCC_APB1ENR.TIM3EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;timer.c,35 :: 		TIM3_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;timer.c,36 :: 		TIM3_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;timer.c,37 :: 		TIM3_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;timer.c,38 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;timer.c,39 :: 		TIM3_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;timer.c,40 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;timer.c,41 :: 		}
L_end_InitTimerMs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimerMs
_Timer3_interrupt:
;timer.c,43 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 {
;timer.c,44 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;timer.c,45 :: 		if(tick_ms<1000000000)
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
LDR	R1, [R0, #0]
MOVW	R0, #51712
MOVT	R0, #15258
CMP	R1, R0
IT	CS
BCS	L_Timer3_interrupt3
;timer.c,46 :: 		tick_ms++;
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_tick_ms+0)
MOVT	R0, #hi_addr(_tick_ms+0)
STR	R1, [R0, #0]
L_Timer3_interrupt3:
;timer.c,47 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
_my_Delay_ms:
;timer.c,49 :: 		void my_Delay_ms(uint32_t num)
; num start address is: 0 (R0)
; num end address is: 0 (R0)
; num start address is: 0 (R0)
;timer.c,51 :: 		tick_ms=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_tick_ms+0)
MOVT	R1, #hi_addr(_tick_ms+0)
STR	R2, [R1, #0]
; num end address is: 0 (R0)
;timer.c,52 :: 		while(tick_ms<num);
L_my_Delay_ms4:
; num start address is: 0 (R0)
MOVW	R1, #lo_addr(_tick_ms+0)
MOVT	R1, #hi_addr(_tick_ms+0)
LDR	R1, [R1, #0]
CMP	R1, R0
IT	CS
BCS	L_my_Delay_ms5
; num end address is: 0 (R0)
IT	AL
BAL	L_my_Delay_ms4
L_my_Delay_ms5:
;timer.c,53 :: 		}
L_end_my_Delay_ms:
BX	LR
; end of _my_Delay_ms
