_initProg:
;main.c,16 :: 		void initProg()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;main.c,18 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
MOVW	R1, #36864
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,19 :: 		InitTimerUs();
BL	_InitTimerUs+0
;main.c,20 :: 		InitTimerMs();
BL	_InitTimerMs+0
;main.c,22 :: 		TIM2_CR1.CEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;main.c,23 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,24 :: 		initLCD();
BL	_initLCD+0
;main.c,25 :: 		initUltrasonic();
BL	_initUltrasonic+0
;main.c,26 :: 		LD1=0; LD2=1;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R0, [SP, #4]
STR	R1, [R0, #0]
;main.c,27 :: 		BME280_Init();
BL	_BME280_Init+0
;main.c,28 :: 		LD1=0; LD2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
LDR	R0, [SP, #4]
STR	R1, [R0, #0]
;main.c,29 :: 		USART2_Init();
BL	_USART2_Init+0
;main.c,30 :: 		RTCInit();
BL	_RTCInit+0
;main.c,31 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;main.c,32 :: 		TIM3_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,34 :: 		}
L_end_initProg:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _initProg
_interRTC:
;main.c,36 :: 		void interRTC() iv IVT_INT_RTC_WKUP ics ICS_AUTO {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;main.c,37 :: 		PWR_CR.DBP = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R2, [R0, #0]
;main.c,38 :: 		RTC_ISR.WUTF = 0; // Clear wake-up event flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(RTC_ISR+0)
MOVT	R0, #hi_addr(RTC_ISR+0)
STR	R1, [R0, #0]
;main.c,39 :: 		PWR_CR.DBP = 0;
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
;main.c,40 :: 		EXTI_PR.PR22 = 1; // Clear wake-up interrupt flag
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R2, [R0, #0]
;main.c,41 :: 		while (RTC_ISR.RSF!=1); // Wait for RTC APB registers synchronization
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
;main.c,43 :: 		LD1=0; LD2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R0, [SP, #16]
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R0, [SP, #12]
STR	R1, [R0, #0]
;main.c,44 :: 		cnt=10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
STRB	R1, [R0, #0]
;main.c,45 :: 		ok=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
STRB	R1, [R0, #0]
;main.c,46 :: 		press=getPressure();
BL	_getPressure+0
MOVW	R0, #lo_addr(_press+0)
MOVT	R0, #hi_addr(_press+0)
STR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;main.c,47 :: 		LD1=1; LD2=0;
MOVS	R2, #1
SXTB	R2, R2
LDR	R0, [SP, #16]
STR	R2, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
LDR	R0, [SP, #12]
STR	R1, [R0, #0]
;main.c,49 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;main.c,50 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R2, [R0, #0]
;main.c,51 :: 		temp=calcTemp();
BL	_calcTemp+0
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
STR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;main.c,53 :: 		hum=calcHumTemp(1);
MOVS	R0, #1
BL	_calcHumTemp+0
MOVW	R0, #lo_addr(_hum+0)
MOVT	R0, #hi_addr(_hum+0)
VSTR	#1, S0, [R0, #0]
;main.c,54 :: 		dist=getDistance();
BL	_getDistance+0
MOVW	R0, #lo_addr(_dist+0)
MOVT	R0, #hi_addr(_dist+0)
VSTR	#1, S0, [R0, #0]
;main.c,55 :: 		LD1=0; LD2=1;
MOVS	R1, #0
SXTB	R1, R1
LDR	R0, [SP, #16]
STR	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
LDR	R0, [SP, #12]
STR	R1, [R0, #0]
;main.c,56 :: 		showTempLCD(temp,press);
LDR	R0, [SP, #8]
VLDR	#1, S1, [R0, #0]
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
BL	_showTempLCD+0
;main.c,57 :: 		ok=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
STRB	R1, [R0, #0]
;main.c,58 :: 		while(ok==0 && cnt>0)
L_interRTC2:
MOVW	R0, #lo_addr(_ok+0)
MOVT	R0, #hi_addr(_ok+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interRTC10
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L__interRTC9
L__interRTC8:
;main.c,60 :: 		ok=sendData(temp, hum, press,dist);
MOVW	R0, #lo_addr(_dist+0)
MOVT	R0, #hi_addr(_dist+0)
VLDR	#1, S3, [R0, #0]
MOVW	R0, #lo_addr(_press+0)
MOVT	R0, #hi_addr(_press+0)
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_hum+0)
MOVT	R0, #hi_addr(_hum+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
VLDR	#1, S0, [R0, #0]
BL	_sendData+0
MOVW	R1, #lo_addr(_ok+0)
MOVT	R1, #hi_addr(_ok+0)
STRB	R0, [R1, #0]
;main.c,61 :: 		showTempLCD(ok,cnt);
MOVW	R1, #lo_addr(_cnt+0)
MOVT	R1, #hi_addr(_cnt+0)
LDRB	R1, [R1, #0]
VMOV	S0, R1
VCVT.F32	#0, S0, S0
VMOV.F32	S1, S0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
BL	_showTempLCD+0
;main.c,62 :: 		cnt--;
MOVW	R1, #lo_addr(_cnt+0)
MOVT	R1, #hi_addr(_cnt+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;main.c,63 :: 		}
IT	AL
BAL	L_interRTC2
;main.c,58 :: 		while(ok==0 && cnt>0)
L__interRTC10:
L__interRTC9:
;main.c,64 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;main.c,65 :: 		TIM3_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,66 :: 		LD1=1; LD2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;main.c,67 :: 		}
L_end_interRTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _interRTC
_main:
;main.c,69 :: 		void main() {
;main.c,70 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
MOVW	R1, #36864
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,71 :: 		LD1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;main.c,72 :: 		initProg();
BL	_initProg+0
;main.c,74 :: 		LD1=1; LD2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;main.c,75 :: 		while(1)
L_main6:
;main.c,86 :: 		asm {WFI};
WFI
;main.c,87 :: 		}
IT	AL
BAL	L_main6
;main.c,88 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
