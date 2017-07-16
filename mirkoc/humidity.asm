_calcHumTemp:
;humidity.c,6 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
; i start address is: 12 (R3)
SUB	SP, SP, #24
STR	LR, [SP, #0]
;humidity.c,7 :: 		uint32_t result = 1, i = 0;
;humidity.c,6 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
;humidity.c,7 :: 		uint32_t result = 1, i = 0;
;humidity.c,6 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
STRB	R0, [SP, #16]
; i end address is: 12 (R3)
;humidity.c,7 :: 		uint32_t result = 1, i = 0;
; i start address is: 12 (R3)
MOV	R3, #0
;humidity.c,9 :: 		float res=0;
MOV	R0, R3
; i end address is: 12 (R3)
;humidity.c,10 :: 		for(i;i<5;i++)
L_calcHumTemp0:
; i start address is: 0 (R0)
CMP	R0, #5
IT	CS
BCS	L_calcHumTemp1
;humidity.c,11 :: 		array[i] = 0;
ADD	R1, SP, #8
ADDS	R2, R1, R0
MOVS	R1, #0
STRB	R1, [R2, #0]
;humidity.c,10 :: 		for(i;i<5;i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 12 (R3)
MOV	R3, R1
;humidity.c,11 :: 		array[i] = 0;
MOV	R0, R3
; i end address is: 12 (R3)
IT	AL
BAL	L_calcHumTemp0
L_calcHumTemp1:
;humidity.c,13 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;humidity.c,14 :: 		HUM_OUT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR7_GPIOC_ODR_bit+0)
MOVT	R2, #hi_addr(ODR7_GPIOC_ODR_bit+0)
STR	R1, [R2, #0]
;humidity.c,15 :: 		HUM_OUT = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;humidity.c,16 :: 		my_Delay_ms(18);
MOVS	R0, #18
BL	_my_Delay_ms+0
;humidity.c,17 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;humidity.c,18 :: 		my_Delay_us(70);
MOVS	R0, #70
BL	_my_Delay_us+0
;humidity.c,20 :: 		my_Delay_us(130);
MOVS	R0, #130
BL	_my_Delay_us+0
;humidity.c,22 :: 		i=0;
; i start address is: 20 (R5)
MOVS	R5, #0
; i end address is: 20 (R5)
;humidity.c,23 :: 		for(i;i<40;i++){
L_calcHumTemp3:
; i start address is: 20 (R5)
CMP	R5, #40
IT	CS
BCS	L_calcHumTemp4
; i end address is: 20 (R5)
MOV	R0, R5
;humidity.c,24 :: 		while(HUM_IN == 0); //CEKAJ UPOSLENO!
L_calcHumTemp6:
; i start address is: 0 (R0)
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp7
IT	AL
BAL	L_calcHumTemp6
L_calcHumTemp7:
;humidity.c,25 :: 		my_Delay_us(50);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;humidity.c,26 :: 		if(HUM_IN == 0)
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp8
;humidity.c,27 :: 		array[i/8] |= HUM_IN<<(7-i%8);
LSRS	R2, R0, #3
ADD	R1, SP, #8
ADDS	R4, R1, R2
AND	R1, R0, #7
RSB	R3, R1, #7
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
LSL	R2, R1, R3
UXTH	R2, R2
LDRB	R1, [R4, #0]
ORRS	R1, R2
STRB	R1, [R4, #0]
IT	AL
BAL	L_calcHumTemp9
L_calcHumTemp8:
;humidity.c,30 :: 		array[i/8] |= HUM_IN<<(7-i%8);
LSRS	R2, R0, #3
ADD	R1, SP, #8
ADDS	R4, R1, R2
AND	R1, R0, #7
RSB	R3, R1, #7
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
LSL	R2, R1, R3
UXTH	R2, R2
LDRB	R1, [R4, #0]
ORRS	R1, R2
STRB	R1, [R4, #0]
;humidity.c,31 :: 		my_Delay_us(50);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;humidity.c,32 :: 		}
L_calcHumTemp9:
;humidity.c,23 :: 		for(i;i<40;i++){
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 20 (R5)
MOV	R5, R1
;humidity.c,33 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_calcHumTemp3
L_calcHumTemp4:
;humidity.c,35 :: 		if(humB==0)
LDRB	R1, [SP, #16]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp10
;humidity.c,37 :: 		res=array[2]&0x7F;
ADD	R3, SP, #8
ADDS	R1, R3, #2
LDRB	R2, [R1, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;humidity.c,38 :: 		res=res*25.6+array[3]*0.1;
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
;humidity.c,39 :: 		if(array[2]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp11
;humidity.c,40 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp11:
;humidity.c,41 :: 		}
IT	AL
BAL	L_calcHumTemp12
L_calcHumTemp10:
;humidity.c,44 :: 		res=array[0]&0x7F;
ADD	R3, SP, #8
LDRB	R2, [R3, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;humidity.c,45 :: 		res=res*25.6+array[1]*0.1;
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
;humidity.c,46 :: 		if(array[0]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp13
;humidity.c,47 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp13:
;humidity.c,48 :: 		}
L_calcHumTemp12:
;humidity.c,49 :: 		return res;
VLDR	#1, S0, [SP, #20]
;humidity.c,50 :: 		}
L_end_calcHumTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _calcHumTemp
