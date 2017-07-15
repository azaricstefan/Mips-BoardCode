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
;timer.c,14 :: 		NVIC_SetIntPriority(IVT_INT_TIM2, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #44
BL	_NVIC_SetIntPriority+0
;timer.c,15 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
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
;timer.c,39 :: 		NVIC_SetIntPriority(IVT_INT_TIM3, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #45
BL	_NVIC_SetIntPriority+0
;timer.c,40 :: 		TIM3_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
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
_RTCInit:
;timer.c,55 :: 		void RTCInit(void) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timer.c,56 :: 		RCC_APB1ENR.PWREN = 1; // Enable RTC clock
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;timer.c,57 :: 		PWR_CR.DBP = 1; // Allow access to RTC
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
;timer.c,58 :: 		RTC_WPR = 0xCA; // Unlock write protection
MOVS	R1, #202
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;timer.c,59 :: 		RTC_WPR = 0x53;
MOVS	R1, #83
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;timer.c,60 :: 		if (RCC_BDCR.RTCEN==0) { // if RTC is disabled,
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit6
;timer.c,61 :: 		RCC_BDCR = 0x00010000; // Reset the backup domain
MOV	R1, #65536
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;timer.c,62 :: 		RCC_BDCR = 0x00008101; // Set RTCEN, select LSE, set LSEON
MOVW	R1, #33025
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;timer.c,63 :: 		}
L_RTCInit6:
;timer.c,64 :: 		while (RTC_ISR.RSF!=1) // Wait for RTC APB registers synchronization
L_RTCInit7:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit8
;timer.c,65 :: 		;
IT	AL
BAL	L_RTCInit7
L_RTCInit8:
;timer.c,66 :: 		while (RCC_BDCR.LSERDY!=1) // Wait till LSE is ready
L_RTCInit9:
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit10
;timer.c,67 :: 		;
IT	AL
BAL	L_RTCInit9
L_RTCInit10:
;timer.c,69 :: 		EXTI_IMR.MR22 = 1; // Set EXTI22 for wake-up timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;timer.c,70 :: 		EXTI_RTSR.TR22 = 1;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;timer.c,71 :: 		RTC_CR.WUTE = 0; // Stop wake-up timer, to access it
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R1, [R0, #0]
;timer.c,72 :: 		while (RTC_ISR.WUTWF!=1) // Wait for wake-up timer access
L_RTCInit11:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit12
;timer.c,73 :: 		;
IT	AL
BAL	L_RTCInit11
L_RTCInit12:
;timer.c,74 :: 		RTC_CR.WUTIE = 1; // Enable wake-up timer interrupt
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R2, [R0, #0]
;timer.c,75 :: 		RTC_WUTR = 15; // Set timer period in seconds
MOVS	R1, #15
MOVW	R0, #lo_addr(RTC_WUTR+0)
MOVT	R0, #hi_addr(RTC_WUTR+0)
STR	R1, [R0, #0]
;timer.c,76 :: 		RTC_CR |= (0x00000004); // Clear WUCKSEL, to select LSE as clock
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R1, [R0, #0]
;timer.c,77 :: 		RTC_CR.WUTE = 1; // Enable wake-up timer
MOVW	R0, #lo_addr(RTC_CR+0)
MOVT	R0, #hi_addr(RTC_CR+0)
STR	R2, [R0, #0]
;timer.c,79 :: 		RTC_ISR |= 0x00000080; // Enter initialization mode, bit 7
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;timer.c,80 :: 		while (RTC_ISR.INITF!=1) // Confirm status, bit 6
L_RTCInit13:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTCInit14
;timer.c,81 :: 		;
IT	AL
BAL	L_RTCInit13
L_RTCInit14:
;timer.c,86 :: 		RTC_ISR &= ~0x00000080; // Exit initialization mode
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;timer.c,88 :: 		RTC_WPR = 0xFF; // Lock write protect
MOVS	R1, #255
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;timer.c,89 :: 		PWR_CR.DBP = 0; // Inhibit RTC access
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
;timer.c,90 :: 		NVIC_IntEnable(IVT_INT_RTC_WKUP); // Enable RTC wake up interrupt
MOVW	R0, #19
BL	_NVIC_IntEnable+0
;timer.c,91 :: 		NVIC_SetIntPriority(IVT_INT_RTC_WKUP, _NVIC_INT_PRIORITY_LVL1);
MOVS	R1, #1
MOVS	R0, #19
BL	_NVIC_SetIntPriority+0
;timer.c,92 :: 		}
L_end_RTCInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTCInit
