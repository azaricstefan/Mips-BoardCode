_InitTimerTemp:
;OneWireTemp.c,9 :: 		void InitTimerTemp(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OneWireTemp.c,10 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;OneWireTemp.c,11 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;OneWireTemp.c,12 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;OneWireTemp.c,13 :: 		TIM2_ARR = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;OneWireTemp.c,14 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;OneWireTemp.c,15 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;OneWireTemp.c,16 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;OneWireTemp.c,17 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
;OneWireTemp.c,18 :: 		}
L_end_InitTimerTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimerTemp
_Timer2_interrupt:
;OneWireTemp.c,20 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;OneWireTemp.c,21 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;OneWireTemp.c,22 :: 		tick2++;
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
;OneWireTemp.c,23 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_oneWireReset:
;OneWireTemp.c,28 :: 		int oneWireReset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OneWireTemp.c,31 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,32 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;OneWireTemp.c,33 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;OneWireTemp.c,34 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
;OneWireTemp.c,36 :: 		while(tick2<=480);
L_oneWireReset0:
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
CMP	R0, #480
IT	HI
BHI	L_oneWireReset1
IT	AL
BAL	L_oneWireReset0
L_oneWireReset1:
;OneWireTemp.c,37 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTemp.c,38 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;OneWireTemp.c,39 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
;OneWireTemp.c,40 :: 		while(tick2<=70);
L_oneWireReset2:
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
CMP	R0, #70
IT	HI
BHI	L_oneWireReset3
IT	AL
BAL	L_oneWireReset2
L_oneWireReset3:
;OneWireTemp.c,42 :: 		ret = OWDI;
MOVW	R0, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R0, #hi_addr(IDR7_GPIOB_IDR_bit+0)
; ret start address is: 44 (R11)
LDR	R11, [R0, #0]
;OneWireTemp.c,43 :: 		if (ret == 0){
CMP	R11, #0
IT	NE
BNE	L_oneWireReset4
;OneWireTemp.c,44 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,45 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTemp.c,46 :: 		}
L_oneWireReset4:
;OneWireTemp.c,47 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
; ret end address is: 44 (R11)
;OneWireTemp.c,49 :: 		while(tick2<=250);
L_oneWireReset5:
; ret start address is: 44 (R11)
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
CMP	R0, #250
IT	HI
BHI	L_oneWireReset6
IT	AL
BAL	L_oneWireReset5
L_oneWireReset6:
;OneWireTemp.c,51 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,52 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTemp.c,55 :: 		return ret;
SXTH	R0, R11
; ret end address is: 44 (R11)
;OneWireTemp.c,56 :: 		}
L_end_oneWireReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireReset
_oneWireWriteBit:
;OneWireTemp.c,58 :: 		void oneWireWriteBit(unsigned short b){
; b start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R0
; b end address is: 0 (R0)
; b start address is: 44 (R11)
;OneWireTemp.c,60 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,61 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R2, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R2, #0]
;OneWireTemp.c,62 :: 		OWDO = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;OneWireTemp.c,63 :: 		if (b){
CMP	R11, #0
IT	EQ
BEQ	L_oneWireWriteBit7
; b end address is: 44 (R11)
;OneWireTemp.c,64 :: 		tick2=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
STRH	R2, [R1, #0]
;OneWireTemp.c,66 :: 		while(tick2<=15);
L_oneWireWriteBit8:
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
LDRH	R1, [R1, #0]
CMP	R1, #15
IT	HI
BHI	L_oneWireWriteBit9
IT	AL
BAL	L_oneWireWriteBit8
L_oneWireWriteBit9:
;OneWireTemp.c,67 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;OneWireTemp.c,68 :: 		tick2=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
STRH	R2, [R1, #0]
;OneWireTemp.c,70 :: 		while(tick2<=50);
L_oneWireWriteBit10:
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
LDRH	R1, [R1, #0]
CMP	R1, #50
IT	HI
BHI	L_oneWireWriteBit11
IT	AL
BAL	L_oneWireWriteBit10
L_oneWireWriteBit11:
;OneWireTemp.c,71 :: 		} else{
IT	AL
BAL	L_oneWireWriteBit12
L_oneWireWriteBit7:
;OneWireTemp.c,72 :: 		tick2=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
STRH	R2, [R1, #0]
;OneWireTemp.c,74 :: 		while(tick2<=65);
L_oneWireWriteBit13:
MOVW	R1, #lo_addr(_tick2+0)
MOVT	R1, #hi_addr(_tick2+0)
LDRH	R1, [R1, #0]
CMP	R1, #65
IT	HI
BHI	L_oneWireWriteBit14
IT	AL
BAL	L_oneWireWriteBit13
L_oneWireWriteBit14:
;OneWireTemp.c,75 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;OneWireTemp.c,76 :: 		}
L_oneWireWriteBit12:
;OneWireTemp.c,77 :: 		}
L_end_oneWireWriteBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireWriteBit
_oneWireReadBit:
;OneWireTemp.c,79 :: 		int oneWireReadBit(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OneWireTemp.c,83 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,84 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;OneWireTemp.c,85 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;OneWireTemp.c,87 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;OneWireTemp.c,88 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
;OneWireTemp.c,90 :: 		while(tick2<=5);
L_oneWireReadBit15:
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
CMP	R0, #5
IT	HI
BHI	L_oneWireReadBit16
IT	AL
BAL	L_oneWireReadBit15
L_oneWireReadBit16:
;OneWireTemp.c,91 :: 		b = OWDI;
MOVW	R0, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R0, #hi_addr(IDR7_GPIOB_IDR_bit+0)
; b start address is: 8 (R2)
LDR	R2, [R0, #0]
;OneWireTemp.c,92 :: 		tick2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
STRH	R1, [R0, #0]
; b end address is: 8 (R2)
SXTH	R11, R2
;OneWireTemp.c,94 :: 		while(tick2<=55);
L_oneWireReadBit17:
; b start address is: 44 (R11)
MOVW	R0, #lo_addr(_tick2+0)
MOVT	R0, #hi_addr(_tick2+0)
LDRH	R0, [R0, #0]
CMP	R0, #55
IT	HI
BHI	L_oneWireReadBit18
IT	AL
BAL	L_oneWireReadBit17
L_oneWireReadBit18:
;OneWireTemp.c,95 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTemp.c,96 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTemp.c,97 :: 		return b;
SXTH	R0, R11
; b end address is: 44 (R11)
;OneWireTemp.c,98 :: 		}
L_end_oneWireReadBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireReadBit
_oneWireWrite:
;OneWireTemp.c,100 :: 		void oneWireWrite(unsigned short byte){
; byte start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; byte end address is: 0 (R0)
; byte start address is: 0 (R0)
;OneWireTemp.c,103 :: 		for (i = 0; i < 8; i++){
; i start address is: 48 (R12)
MOVW	R12, #0
SXTH	R12, R12
; byte end address is: 0 (R0)
; i end address is: 48 (R12)
L_oneWireWrite19:
; i start address is: 48 (R12)
; byte start address is: 0 (R0)
CMP	R12, #8
IT	GE
BGE	L_oneWireWrite20
;OneWireTemp.c,104 :: 		b = byte & 0x01;
AND	R1, R0, #1
;OneWireTemp.c,105 :: 		oneWireWriteBit(b);
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_oneWireWriteBit+0
LDRB	R0, [SP, #4]
;OneWireTemp.c,106 :: 		byte >>=1;
LSRS	R0, R0, #1
UXTB	R0, R0
;OneWireTemp.c,103 :: 		for (i = 0; i < 8; i++){
ADD	R12, R12, #1
SXTH	R12, R12
;OneWireTemp.c,107 :: 		}
; byte end address is: 0 (R0)
; i end address is: 48 (R12)
IT	AL
BAL	L_oneWireWrite19
L_oneWireWrite20:
;OneWireTemp.c,108 :: 		}
L_end_oneWireWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireWrite
_oneWireRead:
;OneWireTemp.c,110 :: 		unsigned short oneWireRead(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTemp.c,113 :: 		byte = 0;
; byte start address is: 4 (R1)
MOVS	R1, #0
;OneWireTemp.c,114 :: 		for (i = 0; i < 8; i++){
; i start address is: 48 (R12)
MOVW	R12, #0
SXTH	R12, R12
; byte end address is: 4 (R1)
; i end address is: 48 (R12)
L_oneWireRead22:
; i start address is: 48 (R12)
; byte start address is: 4 (R1)
CMP	R12, #8
IT	GE
BGE	L_oneWireRead23
;OneWireTemp.c,115 :: 		b = oneWireReadBit();
STRB	R1, [SP, #4]
BL	_oneWireReadBit+0
LDRB	R1, [SP, #4]
;OneWireTemp.c,116 :: 		b <<= i;
UXTB	R0, R0
LSL	R0, R0, R12
;OneWireTemp.c,117 :: 		byte |= b;
UXTB	R0, R0
ORRS	R1, R0
UXTB	R1, R1
;OneWireTemp.c,114 :: 		for (i = 0; i < 8; i++){
ADD	R12, R12, #1
SXTH	R12, R12
;OneWireTemp.c,118 :: 		}
; i end address is: 48 (R12)
IT	AL
BAL	L_oneWireRead22
L_oneWireRead23:
;OneWireTemp.c,119 :: 		return byte;
UXTB	R0, R1
; byte end address is: 4 (R1)
;OneWireTemp.c,120 :: 		}
L_end_oneWireRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireRead
_calcTemp:
;OneWireTemp.c,122 :: 		float calcTemp()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTemp.c,128 :: 		test = oneWireReset();
BL	_oneWireReset+0
;OneWireTemp.c,129 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;OneWireTemp.c,130 :: 		oneWireWrite(0x44);          //CALC_TEMP
MOVS	R0, #68
BL	_oneWireWrite+0
;OneWireTemp.c,131 :: 		Delay_ms(750);     // Vreme merenja
MOVW	R7, #50046
MOVT	R7, #457
NOP
NOP
L_calcTemp25:
SUBS	R7, R7, #1
BNE	L_calcTemp25
NOP
NOP
NOP
;OneWireTemp.c,132 :: 		test = oneWireReset();
BL	_oneWireReset+0
;OneWireTemp.c,133 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;OneWireTemp.c,134 :: 		oneWireWrite(0xBE);          //READ SCRATCHPAD
MOVS	R0, #190
BL	_oneWireWrite+0
;OneWireTemp.c,136 :: 		temp = oneWireRead();
BL	_oneWireRead+0
;OneWireTemp.c,137 :: 		tempDec = 0x0F & temp;
AND	R1, R0, #15
STRB	R1, [SP, #5]
;OneWireTemp.c,138 :: 		temp >>= 4;
LSRS	R0, R0, #4
STRB	R0, [SP, #4]
;OneWireTemp.c,139 :: 		temp = (oneWireRead() << 4) + temp ;
BL	_oneWireRead+0
LSLS	R1, R0, #4
UXTH	R1, R1
LDRB	R0, [SP, #4]
ADDS	R2, R1, R0
UXTH	R2, R2
;OneWireTemp.c,140 :: 		tempF= temp+tempDec*1.0/16;
LDRB	R0, [SP, #5]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMOV.F32	S0, #16
VDIV.F32	S1, S1, S0
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VADD.F32	S0, S0, S1
;OneWireTemp.c,141 :: 		return tempF;
VMOV.F32	S0, S0
;OneWireTemp.c,143 :: 		}
L_end_calcTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _calcTemp
