_oneWireReset:
;temperature.c,7 :: 		uint8_t oneWireReset(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,10 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,11 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;temperature.c,12 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;temperature.c,13 :: 		my_Delay_us(480);
MOVW	R0, #480
BL	_my_Delay_us+0
;temperature.c,14 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,15 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;temperature.c,17 :: 		my_Delay_us(70);
MOVS	R0, #70
BL	_my_Delay_us+0
;temperature.c,18 :: 		ret = OWDI;
MOVW	R1, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR7_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;temperature.c,19 :: 		if (ret == 0){
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_oneWireReset0
;temperature.c,20 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,21 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,22 :: 		}
L_oneWireReset0:
;temperature.c,23 :: 		my_Delay_us(250);
MOVS	R0, #250
BL	_my_Delay_us+0
;temperature.c,25 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,26 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,27 :: 		return ret;
LDRB	R0, [SP, #4]
;temperature.c,28 :: 		}
L_end_oneWireReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReset
_oneWireWriteBit:
;temperature.c,30 :: 		void oneWireWriteBit(uint8_t b){
; b start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R0
; b end address is: 0 (R0)
; b start address is: 44 (R11)
;temperature.c,31 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,32 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R2, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R2, #0]
;temperature.c,33 :: 		OWDO = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;temperature.c,34 :: 		if (b){
CMP	R11, #0
IT	EQ
BEQ	L_oneWireWriteBit1
; b end address is: 44 (R11)
;temperature.c,35 :: 		my_Delay_us(15);
MOVS	R0, #15
BL	_my_Delay_us+0
;temperature.c,36 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;temperature.c,37 :: 		my_Delay_us(50);
MOVS	R0, #50
BL	_my_Delay_us+0
;temperature.c,38 :: 		} else{
IT	AL
BAL	L_oneWireWriteBit2
L_oneWireWriteBit1:
;temperature.c,39 :: 		my_Delay_us(65);
MOVS	R0, #65
BL	_my_Delay_us+0
;temperature.c,40 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;temperature.c,41 :: 		}
L_oneWireWriteBit2:
;temperature.c,42 :: 		}
L_end_oneWireWriteBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireWriteBit
_oneWireReadBit:
;temperature.c,44 :: 		int oneWireReadBit(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,46 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,47 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;temperature.c,48 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;temperature.c,50 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;temperature.c,51 :: 		my_Delay_us(5);
MOVS	R0, #5
BL	_my_Delay_us+0
;temperature.c,52 :: 		b = OWDI;
MOVW	R1, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR7_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;temperature.c,53 :: 		my_Delay_us(55);
MOVS	R0, #55
BL	_my_Delay_us+0
;temperature.c,54 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,55 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,56 :: 		return b;
LDRB	R0, [SP, #4]
;temperature.c,57 :: 		}
L_end_oneWireReadBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReadBit
_oneWireWrite:
;temperature.c,59 :: 		void oneWireWrite(unsigned short byte){
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
;temperature.c,61 :: 		for (i = 0; i < 8; i++){
MOVS	R1, #0
STRB	R1, [SP, #4]
L_oneWireWrite3:
LDRB	R1, [SP, #4]
CMP	R1, #8
IT	CS
BCS	L_oneWireWrite4
;temperature.c,62 :: 		b = byte & 0x01;
LDRB	R1, [SP, #8]
AND	R1, R1, #1
;temperature.c,63 :: 		oneWireWriteBit(b);
UXTB	R0, R1
BL	_oneWireWriteBit+0
;temperature.c,64 :: 		byte >>=1;
LDRB	R1, [SP, #8]
LSRS	R1, R1, #1
STRB	R1, [SP, #8]
;temperature.c,61 :: 		for (i = 0; i < 8; i++){
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;temperature.c,65 :: 		}
IT	AL
BAL	L_oneWireWrite3
L_oneWireWrite4:
;temperature.c,66 :: 		}
L_end_oneWireWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _oneWireWrite
_oneWireRead:
;temperature.c,68 :: 		unsigned short oneWireRead(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,70 :: 		byte = 0;
; byte start address is: 8 (R2)
MOVS	R2, #0
;temperature.c,71 :: 		for (i = 0; i < 8; i++){
; i start address is: 4 (R1)
MOVS	R1, #0
; byte end address is: 8 (R2)
; i end address is: 4 (R1)
L_oneWireRead6:
; i start address is: 4 (R1)
; byte start address is: 8 (R2)
CMP	R1, #8
IT	CS
BCS	L_oneWireRead7
;temperature.c,72 :: 		b = oneWireReadBit();
STRB	R2, [SP, #4]
STRB	R1, [SP, #5]
BL	_oneWireReadBit+0
LDRB	R1, [SP, #5]
LDRB	R2, [SP, #4]
;temperature.c,73 :: 		b <<= i;
UXTB	R0, R0
LSLS	R0, R1
;temperature.c,74 :: 		byte |= b;
UXTB	R0, R0
ORRS	R2, R0
UXTB	R2, R2
;temperature.c,71 :: 		for (i = 0; i < 8; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;temperature.c,75 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_oneWireRead6
L_oneWireRead7:
;temperature.c,76 :: 		return byte;
UXTB	R0, R2
; byte end address is: 8 (R2)
;temperature.c,77 :: 		}
L_end_oneWireRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireRead
_calcTemp:
;temperature.c,79 :: 		float calcTemp()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,86 :: 		test = oneWireReset();
BL	_oneWireReset+0
;temperature.c,87 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;temperature.c,88 :: 		oneWireWrite(0x44);          //CALC_TEMP
MOVS	R0, #68
BL	_oneWireWrite+0
;temperature.c,89 :: 		my_Delay_ms(750);     // Vreme merenja
MOVW	R0, #750
BL	_my_Delay_ms+0
;temperature.c,90 :: 		test = oneWireReset();
BL	_oneWireReset+0
;temperature.c,91 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;temperature.c,92 :: 		oneWireWrite(0xBE);          //READ SCRATCHPAD
MOVS	R0, #190
BL	_oneWireWrite+0
;temperature.c,94 :: 		temp=oneWireRead();
BL	_oneWireRead+0
; temp start address is: 4 (R1)
UXTB	R1, R0
;temperature.c,95 :: 		temp=temp+(oneWireRead()<<8);
STR	R1, [SP, #4]
BL	_oneWireRead+0
LDR	R1, [SP, #4]
LSLS	R0, R0, #8
UXTH	R0, R0
ADDS	R0, R1, R0
; temp end address is: 4 (R1)
; temp start address is: 8 (R2)
MOV	R2, R0
;temperature.c,96 :: 		if(temp & 0xF000)
AND	R0, R0, #61440
CMP	R0, #0
IT	EQ
BEQ	L__calcTemp10
;temperature.c,98 :: 		temp=(~temp)&0x0000FFFF;
MVN	R1, R2
; temp end address is: 8 (R2)
MOVW	R0, #65535
AND	R0, R1, R0, LSL #0
;temperature.c,99 :: 		temp=temp+1;
ADDS	R0, R0, #1
;temperature.c,100 :: 		temp=-temp;
RSBS	R0, R0, #0
; temp start address is: 4 (R1)
MOV	R1, R0
; temp end address is: 4 (R1)
MOV	R0, R1
;temperature.c,101 :: 		}
IT	AL
BAL	L_calcTemp9
L__calcTemp10:
;temperature.c,96 :: 		if(temp & 0xF000)
MOV	R0, R2
;temperature.c,101 :: 		}
L_calcTemp9:
;temperature.c,102 :: 		tempF=temp*1.0/16.0;
; temp start address is: 0 (R0)
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; temp end address is: 0 (R0)
VMOV.F32	S0, #16
VDIV.F32	S0, S1, S0
;temperature.c,103 :: 		return tempF;
VMOV.F32	S0, S0
;temperature.c,104 :: 		}
L_end_calcTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _calcTemp
