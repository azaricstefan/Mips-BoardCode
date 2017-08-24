_crc8:
;temperature.c,9 :: 		uint8_t crc8()
;temperature.c,12 :: 		crc = 0;
; crc start address is: 20 (R5)
MOVS	R5, #0
;temperature.c,13 :: 		for(j=0;j<8; j++)
; j start address is: 12 (R3)
MOVS	R3, #0
; crc end address is: 20 (R5)
; j end address is: 12 (R3)
L_crc80:
; j start address is: 12 (R3)
; crc start address is: 20 (R5)
CMP	R3, #8
IT	CS
BCS	L_crc81
;temperature.c,15 :: 		cur=scratchpad[j];
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
ADDS	R0, R0, R3
LDRB	R4, [R0, #0]
; cur start address is: 16 (R4)
;temperature.c,16 :: 		for (i = 0; i < 8; i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; crc end address is: 20 (R5)
; cur end address is: 16 (R4)
; i end address is: 8 (R2)
; j end address is: 12 (R3)
L_crc83:
; i start address is: 8 (R2)
; cur start address is: 16 (R4)
; crc start address is: 20 (R5)
; j start address is: 12 (R3)
CMP	R2, #8
IT	CS
BCS	L_crc84
;temperature.c,18 :: 		mix=crc^cur;
EOR	R1, R5, R4, LSL #0
UXTB	R1, R1
;temperature.c,19 :: 		crc=crc>>1;
LSRS	R5, R5, #1
UXTB	R5, R5
;temperature.c,20 :: 		if (mix&0x01)
AND	R0, R1, #1
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L__crc827
;temperature.c,21 :: 		crc=crc^0x8C;
EOR	R5, R5, #140
UXTB	R5, R5
; crc end address is: 20 (R5)
IT	AL
BAL	L_crc86
L__crc827:
;temperature.c,20 :: 		if (mix&0x01)
;temperature.c,21 :: 		crc=crc^0x8C;
L_crc86:
;temperature.c,22 :: 		cur=cur>>1;
; crc start address is: 20 (R5)
LSRS	R4, R4, #1
UXTB	R4, R4
;temperature.c,16 :: 		for (i = 0; i < 8; i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;temperature.c,23 :: 		}
; cur end address is: 16 (R4)
; i end address is: 8 (R2)
IT	AL
BAL	L_crc83
L_crc84:
;temperature.c,13 :: 		for(j=0;j<8; j++)
ADDS	R3, R3, #1
UXTB	R3, R3
;temperature.c,24 :: 		}
; j end address is: 12 (R3)
IT	AL
BAL	L_crc80
L_crc81:
;temperature.c,26 :: 		return crc;
UXTB	R0, R5
; crc end address is: 20 (R5)
;temperature.c,27 :: 		}
L_end_crc8:
BX	LR
; end of _crc8
_oneWireReset:
;temperature.c,30 :: 		uint8_t oneWireReset(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,33 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,34 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;temperature.c,35 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;temperature.c,36 :: 		my_Delay_us(_TEMP_RESET_START);
MOVW	R0, #480
BL	_my_Delay_us+0
;temperature.c,37 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,38 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;temperature.c,40 :: 		my_Delay_us(_TEMP_RESET_1);
MOVS	R0, #70
BL	_my_Delay_us+0
;temperature.c,41 :: 		ret = OWDI;
MOVW	R1, #lo_addr(IDR1_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR1_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;temperature.c,42 :: 		if (ret == 0){
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_oneWireReset7
;temperature.c,43 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,44 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,45 :: 		}
L_oneWireReset7:
;temperature.c,46 :: 		my_Delay_us(_TEMP_RESET_2);
MOVS	R0, #250
BL	_my_Delay_us+0
;temperature.c,48 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,49 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,50 :: 		return ret;
LDRB	R0, [SP, #4]
;temperature.c,51 :: 		}
L_end_oneWireReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReset
_oneWireWriteBit:
;temperature.c,53 :: 		void oneWireWriteBit(uint8_t b){
; b start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R0
; b end address is: 0 (R0)
; b start address is: 44 (R11)
;temperature.c,54 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,55 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R2, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R2, #0]
;temperature.c,56 :: 		OWDO = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;temperature.c,57 :: 		if (b){
CMP	R11, #0
IT	EQ
BEQ	L_oneWireWriteBit8
; b end address is: 44 (R11)
;temperature.c,58 :: 		my_Delay_us(_TEMP_READ_ONE_1);
MOVS	R0, #15
BL	_my_Delay_us+0
;temperature.c,59 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;temperature.c,60 :: 		my_Delay_us(_TEMP_READ_ONE_2);
MOVS	R0, #50
BL	_my_Delay_us+0
;temperature.c,61 :: 		} else{
IT	AL
BAL	L_oneWireWriteBit9
L_oneWireWriteBit8:
;temperature.c,62 :: 		my_Delay_us(_TEMP_READ_ZERO);
MOVS	R0, #65
BL	_my_Delay_us+0
;temperature.c,63 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;temperature.c,64 :: 		}
L_oneWireWriteBit9:
;temperature.c,65 :: 		}
L_end_oneWireWriteBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireWriteBit
_oneWireReadBit:
;temperature.c,67 :: 		int oneWireReadBit(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,69 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,70 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;temperature.c,71 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;temperature.c,73 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;temperature.c,74 :: 		my_Delay_us(_TEMP_READ_INIT);
MOVS	R0, #5
BL	_my_Delay_us+0
;temperature.c,75 :: 		b = OWDI;
MOVW	R1, #lo_addr(IDR1_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR1_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;temperature.c,76 :: 		my_Delay_us(_TEMP_READ_WAIT);
MOVS	R0, #55
BL	_my_Delay_us+0
;temperature.c,77 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;temperature.c,78 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;temperature.c,79 :: 		return b;
LDRB	R0, [SP, #4]
;temperature.c,80 :: 		}
L_end_oneWireReadBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReadBit
_oneWireWrite:
;temperature.c,82 :: 		void oneWireWrite(unsigned short byte){
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
;temperature.c,84 :: 		for (i = 0; i < 8; i++){
MOVS	R1, #0
STRB	R1, [SP, #4]
L_oneWireWrite10:
LDRB	R1, [SP, #4]
CMP	R1, #8
IT	CS
BCS	L_oneWireWrite11
;temperature.c,85 :: 		b = byte & 0x01;
LDRB	R1, [SP, #8]
AND	R1, R1, #1
;temperature.c,86 :: 		oneWireWriteBit(b);
UXTB	R0, R1
BL	_oneWireWriteBit+0
;temperature.c,87 :: 		byte >>=1;
LDRB	R1, [SP, #8]
LSRS	R1, R1, #1
STRB	R1, [SP, #8]
;temperature.c,84 :: 		for (i = 0; i < 8; i++){
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;temperature.c,88 :: 		}
IT	AL
BAL	L_oneWireWrite10
L_oneWireWrite11:
;temperature.c,89 :: 		}
L_end_oneWireWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _oneWireWrite
_oneWireRead:
;temperature.c,91 :: 		unsigned short oneWireRead(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;temperature.c,93 :: 		byte = 0;
; byte start address is: 8 (R2)
MOVS	R2, #0
;temperature.c,94 :: 		for (i = 0; i < 8; i++){
; i start address is: 4 (R1)
MOVS	R1, #0
; byte end address is: 8 (R2)
; i end address is: 4 (R1)
L_oneWireRead13:
; i start address is: 4 (R1)
; byte start address is: 8 (R2)
CMP	R1, #8
IT	CS
BCS	L_oneWireRead14
;temperature.c,95 :: 		b = oneWireReadBit();
STRB	R2, [SP, #4]
STRB	R1, [SP, #5]
BL	_oneWireReadBit+0
LDRB	R1, [SP, #5]
LDRB	R2, [SP, #4]
;temperature.c,96 :: 		b <<= i;
UXTB	R0, R0
LSLS	R0, R1
;temperature.c,97 :: 		byte |= b;
UXTB	R0, R0
ORRS	R2, R0
UXTB	R2, R2
;temperature.c,94 :: 		for (i = 0; i < 8; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;temperature.c,98 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_oneWireRead13
L_oneWireRead14:
;temperature.c,99 :: 		return byte;
UXTB	R0, R2
; byte end address is: 8 (R2)
;temperature.c,100 :: 		}
L_end_oneWireRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireRead
_calcTemp:
;temperature.c,102 :: 		float calcTemp()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;temperature.c,110 :: 		test = oneWireReset();
BL	_oneWireReset+0
;temperature.c,111 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;temperature.c,113 :: 		oneWireWrite(0x4E);   // WRITE SCRATCHPAD from byte 2 to 5 (2,3,4)
MOVS	R0, #78
BL	_oneWireWrite+0
;temperature.c,114 :: 		oneWireWrite(0x00);   // Alarm TH
MOVS	R0, #0
BL	_oneWireWrite+0
;temperature.c,115 :: 		oneWireWrite(0x00);   // Alarm TL
MOVS	R0, #0
BL	_oneWireWrite+0
;temperature.c,116 :: 		switch(precision) {
IT	AL
BAL	L_calcTemp16
;temperature.c,117 :: 		case _DOUBLE_PRECISION:
L_calcTemp18:
;temperature.c,118 :: 		oneWireWrite(_DOUBLE_PRECISION_CODED);
MOVS	R0, #31
BL	_oneWireWrite+0
;temperature.c,119 :: 		measureTime = _WAIT_FOR_MESURING_x2;
; measureTime start address is: 0 (R0)
MOVS	R0, #100
SXTH	R0, R0
;temperature.c,120 :: 		break;
; measureTime end address is: 0 (R0)
IT	AL
BAL	L_calcTemp17
;temperature.c,121 :: 		case _FOUR__PRECISION:
L_calcTemp19:
;temperature.c,122 :: 		oneWireWrite(_FOUR_PRECISION_CODED);
MOVS	R0, #63
BL	_oneWireWrite+0
;temperature.c,123 :: 		measureTime = _WAIT_FOR_MESURING_x4;
; measureTime start address is: 0 (R0)
MOVS	R0, #200
SXTH	R0, R0
;temperature.c,124 :: 		break;
; measureTime end address is: 0 (R0)
IT	AL
BAL	L_calcTemp17
;temperature.c,125 :: 		case _EIGHT_PRECISION:
L_calcTemp20:
;temperature.c,126 :: 		oneWireWrite(_EIGHT_PRECISION_CODED);
MOVS	R0, #95
BL	_oneWireWrite+0
;temperature.c,127 :: 		measureTime = _WAIT_FOR_MESURING_x8;
; measureTime start address is: 0 (R0)
MOVW	R0, #400
SXTH	R0, R0
;temperature.c,128 :: 		break;
; measureTime end address is: 0 (R0)
IT	AL
BAL	L_calcTemp17
;temperature.c,129 :: 		default:
L_calcTemp21:
;temperature.c,130 :: 		oneWireWrite(_SIXTEEN_PRECISION_CODED);
MOVS	R0, #127
BL	_oneWireWrite+0
;temperature.c,131 :: 		measureTime = _WAIT_FOR_MESURING_x16;
; measureTime start address is: 0 (R0)
MOVW	R0, #750
SXTH	R0, R0
;temperature.c,132 :: 		}
; measureTime end address is: 0 (R0)
IT	AL
BAL	L_calcTemp17
L_calcTemp16:
MOVW	R0, #lo_addr(temperature_precision+0)
MOVT	R0, #hi_addr(temperature_precision+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_calcTemp18
MOVW	R0, #lo_addr(temperature_precision+0)
MOVT	R0, #hi_addr(temperature_precision+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_calcTemp19
MOVW	R0, #lo_addr(temperature_precision+0)
MOVT	R0, #hi_addr(temperature_precision+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_calcTemp20
IT	AL
BAL	L_calcTemp21
L_calcTemp17:
;temperature.c,134 :: 		test = oneWireReset();
; measureTime start address is: 0 (R0)
STRH	R0, [SP, #4]
BL	_oneWireReset+0
;temperature.c,135 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;temperature.c,136 :: 		oneWireWrite(0x44);          //CALC_TEMP
MOVS	R0, #68
BL	_oneWireWrite+0
LDRSH	R0, [SP, #4]
;temperature.c,137 :: 		my_Delay_ms(measureTime);     // Vreme merenja
; measureTime end address is: 0 (R0)
BL	_my_Delay_ms+0
;temperature.c,138 :: 		test = oneWireReset();
BL	_oneWireReset+0
;temperature.c,139 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;temperature.c,140 :: 		oneWireWrite(0xBE);          //READ SCRATCHPAD
MOVS	R0, #190
BL	_oneWireWrite+0
;temperature.c,142 :: 		for(i=0; i<9; i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_calcTemp22:
; i start address is: 8 (R2)
CMP	R2, #9
IT	CS
BCS	L_calcTemp23
;temperature.c,144 :: 		scratchpad[i]=oneWireRead();
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
ADDS	R0, R0, R2
STR	R0, [SP, #8]
STRB	R2, [SP, #4]
BL	_oneWireRead+0
LDRB	R2, [SP, #4]
LDR	R1, [SP, #8]
STRB	R0, [R1, #0]
;temperature.c,142 :: 		for(i=0; i<9; i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;temperature.c,145 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_calcTemp22
L_calcTemp23:
;temperature.c,152 :: 		temp=scratchpad[0];
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
; temp start address is: 4 (R1)
LDRB	R1, [R0, #0]
;temperature.c,153 :: 		temp=temp+(scratchpad[1]<<8);
MOVW	R0, #lo_addr(_scratchpad+1)
MOVT	R0, #hi_addr(_scratchpad+1)
LDRB	R0, [R0, #0]
LSLS	R0, R0, #8
UXTH	R0, R0
ADDS	R0, R1, R0
; temp end address is: 4 (R1)
; temp start address is: 24 (R6)
MOV	R6, R0
;temperature.c,154 :: 		res= crc8();
BL	_crc8+0
;temperature.c,155 :: 		if(res!=scratchpad[8])
MOVW	R1, #lo_addr(_scratchpad+8)
MOVT	R1, #hi_addr(_scratchpad+8)
LDRB	R1, [R1, #0]
CMP	R0, R1
IT	EQ
BEQ	L_calcTemp25
; temp end address is: 24 (R6)
;temperature.c,156 :: 		return _ERROR_TEMP;
MOVW	R0, #0
MOVT	R0, #49864
VMOV	S0, R0
IT	AL
BAL	L_end_calcTemp
L_calcTemp25:
;temperature.c,158 :: 		if(temp & 0xF000)
; temp start address is: 24 (R6)
AND	R0, R6, #61440
CMP	R0, #0
IT	EQ
BEQ	L__calcTemp28
;temperature.c,160 :: 		temp=(~temp)&0x0000FFFF;
MVN	R1, R6
; temp end address is: 24 (R6)
MOVW	R0, #65535
AND	R0, R1, R0, LSL #0
;temperature.c,161 :: 		temp=temp+1;
ADDS	R0, R0, #1
;temperature.c,162 :: 		temp=-temp;
RSBS	R0, R0, #0
; temp start address is: 4 (R1)
MOV	R1, R0
; temp end address is: 4 (R1)
MOV	R0, R1
;temperature.c,163 :: 		}
IT	AL
BAL	L_calcTemp26
L__calcTemp28:
;temperature.c,158 :: 		if(temp & 0xF000)
MOV	R0, R6
;temperature.c,163 :: 		}
L_calcTemp26:
;temperature.c,164 :: 		tempF=temp*1.0/16.0;
; temp start address is: 0 (R0)
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; temp end address is: 0 (R0)
VMOV.F32	S0, #16
VDIV.F32	S0, S1, S0
;temperature.c,165 :: 		return tempF;
VMOV.F32	S0, S0
;temperature.c,166 :: 		}
L_end_calcTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calcTemp
_setPrecision:
;temperature.c,168 :: 		void setPrecision(uint8_t precision_) {
; precision_ start address is: 0 (R0)
; precision_ end address is: 0 (R0)
; precision_ start address is: 0 (R0)
;temperature.c,169 :: 		precision = precision_;
MOVW	R1, #lo_addr(temperature_precision+0)
MOVT	R1, #hi_addr(temperature_precision+0)
STRB	R0, [R1, #0]
; precision_ end address is: 0 (R0)
;temperature.c,170 :: 		}
L_end_setPrecision:
BX	LR
; end of _setPrecision
