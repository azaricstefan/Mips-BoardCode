_calcHumTemp:
;humidity.c,7 :: 		float calcHumTemp(uint8_t humB){
; i start address is: 16 (R4)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;humidity.c,8 :: 		uint32_t result = 1, i = 0;
;humidity.c,7 :: 		float calcHumTemp(uint8_t humB){
;humidity.c,8 :: 		uint32_t result = 1, i = 0;
;humidity.c,7 :: 		float calcHumTemp(uint8_t humB){
STRB	R0, [SP, #24]
; i end address is: 16 (R4)
;humidity.c,8 :: 		uint32_t result = 1, i = 0;
; i start address is: 16 (R4)
MOV	R4, #0
;humidity.c,10 :: 		uint32_t checksum=0;
ADD	R11, SP, #16
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICScalcHumTemp_checksum_L0+0)
MOVT	R12, #hi_addr(?ICScalcHumTemp_checksum_L0+0)
BL	___CC2DW+0
;humidity.c,11 :: 		float res=0;
; i end address is: 16 (R4)
MOV	R0, R4
;humidity.c,12 :: 		for(i;i<5;i++)
L_calcHumTemp0:
; i start address is: 0 (R0)
CMP	R0, #5
IT	CS
BCS	L_calcHumTemp1
;humidity.c,13 :: 		array[i] = 0;
ADD	R1, SP, #8
ADDS	R2, R1, R0
MOVS	R1, #0
STRB	R1, [R2, #0]
;humidity.c,12 :: 		for(i;i<5;i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 16 (R4)
MOV	R4, R1
;humidity.c,13 :: 		array[i] = 0;
MOV	R0, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_calcHumTemp0
L_calcHumTemp1:
;humidity.c,14 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;humidity.c,15 :: 		HUM_OUT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR1_GPIOC_ODR_bit+0)
MOVT	R2, #hi_addr(ODR1_GPIOC_ODR_bit+0)
STR	R1, [R2, #0]
;humidity.c,16 :: 		HUM_OUT = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;humidity.c,17 :: 		my_Delay_ms(_INIT_TIME_SET);
MOVS	R0, #18
BL	_my_Delay_ms+0
;humidity.c,18 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;humidity.c,19 :: 		my_Delay_us(_INIT_TIME_WAIT_1);
MOVS	R0, #70
BL	_my_Delay_us+0
;humidity.c,21 :: 		if(res==1)
VLDR	#1, S1, [SP, #20]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	NE
BNE	L_calcHumTemp3
;humidity.c,22 :: 		return _ERROR_HUM;
MOVW	R1, #0
MOVT	R1, #49864
VMOV	S0, R1
IT	AL
BAL	L_end_calcHumTemp
L_calcHumTemp3:
;humidity.c,23 :: 		my_Delay_us(_INIT_TIME_WAIT_2);
MOVS	R0, #130
BL	_my_Delay_us+0
;humidity.c,25 :: 		i=0;
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
;humidity.c,26 :: 		for(i;i<40;i++){
L_calcHumTemp4:
; i start address is: 24 (R6)
CMP	R6, #40
IT	CS
BCS	L_calcHumTemp5
; i end address is: 24 (R6)
MOV	R0, R6
;humidity.c,27 :: 		while(HUM_IN == 0);
L_calcHumTemp7:
; i start address is: 0 (R0)
MOVW	R2, #lo_addr(IDR1_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR1_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp8
IT	AL
BAL	L_calcHumTemp7
L_calcHumTemp8:
;humidity.c,28 :: 		my_Delay_us(_TIME_HUM_READ);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;humidity.c,29 :: 		array[i/8] |= HUM_IN<<(7-i%8);
LSRS	R2, R0, #3
ADD	R1, SP, #8
ADDS	R4, R1, R2
AND	R1, R0, #7
RSB	R2, R1, #7
MOVW	R3, #lo_addr(IDR1_GPIOC_IDR_bit+0)
MOVT	R3, #hi_addr(IDR1_GPIOC_IDR_bit+0)
LDR	R1, [R3, #0]
LSL	R2, R1, R2
UXTH	R2, R2
LDRB	R1, [R4, #0]
ORRS	R1, R2
STRB	R1, [R4, #0]
;humidity.c,30 :: 		if(HUM_IN == 1)
MOV	R2, R3
LDR	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp9
;humidity.c,31 :: 		my_Delay_us(_TIME_HUM_READ);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
L_calcHumTemp9:
;humidity.c,26 :: 		for(i;i<40;i++){
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 24 (R6)
MOV	R6, R1
;humidity.c,32 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_calcHumTemp4
L_calcHumTemp5:
;humidity.c,33 :: 		for(i=0; i<4; i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
MOV	R0, R2
L_calcHumTemp10:
; i start address is: 0 (R0)
CMP	R0, #4
IT	CS
BCS	L_calcHumTemp11
;humidity.c,34 :: 		checksum+=array[i];
ADD	R1, SP, #8
ADDS	R1, R1, R0
LDRB	R2, [R1, #0]
LDR	R1, [SP, #16]
ADDS	R1, R1, R2
STR	R1, [SP, #16]
;humidity.c,33 :: 		for(i=0; i<4; i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 8 (R2)
MOV	R2, R1
;humidity.c,34 :: 		checksum+=array[i];
MOV	R0, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_calcHumTemp10
L_calcHumTemp11:
;humidity.c,35 :: 		if((checksum&0x00FF)!= array[4])
LDR	R1, [SP, #16]
AND	R2, R1, #255
ADD	R1, SP, #8
ADDS	R1, R1, #4
LDRB	R1, [R1, #0]
CMP	R2, R1
IT	EQ
BEQ	L_calcHumTemp13
;humidity.c,36 :: 		return _ERROR_HUM;
MOVW	R1, #0
MOVT	R1, #49864
VMOV	S0, R1
IT	AL
BAL	L_end_calcHumTemp
L_calcHumTemp13:
;humidity.c,37 :: 		if(humB==0)
LDRB	R1, [SP, #24]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp14
;humidity.c,39 :: 		res=array[2]&0x7F;
ADD	R3, SP, #8
ADDS	R1, R3, #2
LDRB	R2, [R1, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;humidity.c,40 :: 		res=res*25.6+array[3]*0.1;
MOVW	R1, #52429
MOVT	R1, #16844
VMOV	S0, R1
VMUL.F32	S2, S1, S0
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #52429
MOVT	R1, #15820
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VADD.F32	S0, S2, S0
VSTR	#1, S0, [SP, #20]
;humidity.c,41 :: 		if(array[2]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp15
;humidity.c,42 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp15:
;humidity.c,43 :: 		}
IT	AL
BAL	L_calcHumTemp16
L_calcHumTemp14:
;humidity.c,46 :: 		res=array[0]&0x7F;
ADD	R3, SP, #8
LDRB	R2, [R3, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;humidity.c,47 :: 		res=res*25.6+array[1]*0.1;
MOVW	R1, #52429
MOVT	R1, #16844
VMOV	S0, R1
VMUL.F32	S2, S1, S0
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #52429
MOVT	R1, #15820
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VADD.F32	S0, S2, S0
VSTR	#1, S0, [SP, #20]
;humidity.c,48 :: 		if(array[0]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp17
;humidity.c,49 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp17:
;humidity.c,50 :: 		}
L_calcHumTemp16:
;humidity.c,52 :: 		return res;
VLDR	#1, S0, [SP, #20]
;humidity.c,53 :: 		}
L_end_calcHumTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _calcHumTemp
