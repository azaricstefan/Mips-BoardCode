_oneWireReset:
;OneWireTempHUm.c,10 :: 		uint8_t oneWireReset(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTempHUm.c,13 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,14 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;OneWireTempHUm.c,15 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;OneWireTempHUm.c,16 :: 		my_Delay_us(480);
MOVW	R0, #480
BL	_my_Delay_us+0
;OneWireTempHUm.c,17 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTempHUm.c,18 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;OneWireTempHUm.c,20 :: 		my_Delay_us(70);
MOVS	R0, #70
BL	_my_Delay_us+0
;OneWireTempHUm.c,21 :: 		ret = OWDI;
MOVW	R1, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR7_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;OneWireTempHUm.c,22 :: 		if (ret == 0){
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_oneWireReset0
;OneWireTempHUm.c,23 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,24 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTempHUm.c,25 :: 		}
L_oneWireReset0:
;OneWireTempHUm.c,26 :: 		my_Delay_us(250);
MOVS	R0, #250
BL	_my_Delay_us+0
;OneWireTempHUm.c,28 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,29 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTempHUm.c,30 :: 		return ret;
LDRB	R0, [SP, #4]
;OneWireTempHUm.c,31 :: 		}
L_end_oneWireReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReset
_oneWireWriteBit:
;OneWireTempHUm.c,33 :: 		void oneWireWriteBit(uint8_t b){
; b start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R0
; b end address is: 0 (R0)
; b start address is: 44 (R11)
;OneWireTempHUm.c,34 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,35 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R2, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R2, #0]
;OneWireTempHUm.c,36 :: 		OWDO = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;OneWireTempHUm.c,37 :: 		if (b){
CMP	R11, #0
IT	EQ
BEQ	L_oneWireWriteBit1
; b end address is: 44 (R11)
;OneWireTempHUm.c,38 :: 		my_Delay_us(15);
MOVS	R0, #15
BL	_my_Delay_us+0
;OneWireTempHUm.c,39 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;OneWireTempHUm.c,40 :: 		my_Delay_us(50);
MOVS	R0, #50
BL	_my_Delay_us+0
;OneWireTempHUm.c,41 :: 		} else{
IT	AL
BAL	L_oneWireWriteBit2
L_oneWireWriteBit1:
;OneWireTempHUm.c,42 :: 		my_Delay_us(65);
MOVS	R0, #65
BL	_my_Delay_us+0
;OneWireTempHUm.c,43 :: 		OWDO = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R1, #0]
;OneWireTempHUm.c,44 :: 		}
L_oneWireWriteBit2:
;OneWireTempHUm.c,45 :: 		}
L_end_oneWireWriteBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireWriteBit
_oneWireReadBit:
;OneWireTempHUm.c,47 :: 		int oneWireReadBit(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTempHUm.c,49 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,50 :: 		OWDO = 1;
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;OneWireTempHUm.c,51 :: 		OWDO = 0;
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
;OneWireTempHUm.c,53 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;OneWireTempHUm.c,54 :: 		my_Delay_us(5);
MOVS	R0, #5
BL	_my_Delay_us+0
;OneWireTempHUm.c,55 :: 		b = OWDI;
MOVW	R1, #lo_addr(IDR7_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR7_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
;OneWireTempHUm.c,56 :: 		my_Delay_us(55);
MOVS	R0, #55
BL	_my_Delay_us+0
;OneWireTempHUm.c,57 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,58 :: 		OWDO = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;OneWireTempHUm.c,59 :: 		return b;
LDRB	R0, [SP, #4]
;OneWireTempHUm.c,60 :: 		}
L_end_oneWireReadBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReadBit
_oneWireWrite:
;OneWireTempHUm.c,62 :: 		void oneWireWrite(unsigned short byte){
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
;OneWireTempHUm.c,64 :: 		for (i = 0; i < 8; i++){
MOVS	R1, #0
STRB	R1, [SP, #4]
L_oneWireWrite3:
LDRB	R1, [SP, #4]
CMP	R1, #8
IT	CS
BCS	L_oneWireWrite4
;OneWireTempHUm.c,65 :: 		b = byte & 0x01;
LDRB	R1, [SP, #8]
AND	R1, R1, #1
;OneWireTempHUm.c,66 :: 		oneWireWriteBit(b);
UXTB	R0, R1
BL	_oneWireWriteBit+0
;OneWireTempHUm.c,67 :: 		byte >>=1;
LDRB	R1, [SP, #8]
LSRS	R1, R1, #1
STRB	R1, [SP, #8]
;OneWireTempHUm.c,64 :: 		for (i = 0; i < 8; i++){
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;OneWireTempHUm.c,68 :: 		}
IT	AL
BAL	L_oneWireWrite3
L_oneWireWrite4:
;OneWireTempHUm.c,69 :: 		}
L_end_oneWireWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _oneWireWrite
_oneWireRead:
;OneWireTempHUm.c,71 :: 		unsigned short oneWireRead(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTempHUm.c,73 :: 		byte = 0;
; byte start address is: 8 (R2)
MOVS	R2, #0
;OneWireTempHUm.c,74 :: 		for (i = 0; i < 8; i++){
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
;OneWireTempHUm.c,75 :: 		b = oneWireReadBit();
STRB	R2, [SP, #4]
STRB	R1, [SP, #5]
BL	_oneWireReadBit+0
LDRB	R1, [SP, #5]
LDRB	R2, [SP, #4]
;OneWireTempHUm.c,76 :: 		b <<= i;
UXTB	R0, R0
LSLS	R0, R1
;OneWireTempHUm.c,77 :: 		byte |= b;
UXTB	R0, R0
ORRS	R2, R0
UXTB	R2, R2
;OneWireTempHUm.c,74 :: 		for (i = 0; i < 8; i++){
ADDS	R1, R1, #1
UXTB	R1, R1
;OneWireTempHUm.c,78 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_oneWireRead6
L_oneWireRead7:
;OneWireTempHUm.c,79 :: 		return byte;
UXTB	R0, R2
; byte end address is: 8 (R2)
;OneWireTempHUm.c,80 :: 		}
L_end_oneWireRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireRead
_calcTemp:
;OneWireTempHUm.c,82 :: 		float calcTemp()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OneWireTempHUm.c,89 :: 		test = oneWireReset();
BL	_oneWireReset+0
;OneWireTempHUm.c,90 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;OneWireTempHUm.c,91 :: 		oneWireWrite(0x44);          //CALC_TEMP
MOVS	R0, #68
BL	_oneWireWrite+0
;OneWireTempHUm.c,92 :: 		my_Delay_ms(750);     // Vreme merenja
MOVW	R0, #750
BL	_my_Delay_ms+0
;OneWireTempHUm.c,93 :: 		test = oneWireReset();
BL	_oneWireReset+0
;OneWireTempHUm.c,94 :: 		oneWireWrite(0xCC);          //SKIP ROM
MOVS	R0, #204
BL	_oneWireWrite+0
;OneWireTempHUm.c,95 :: 		oneWireWrite(0xBE);          //READ SCRATCHPAD
MOVS	R0, #190
BL	_oneWireWrite+0
;OneWireTempHUm.c,97 :: 		temp=oneWireRead();
BL	_oneWireRead+0
; temp start address is: 4 (R1)
UXTB	R1, R0
;OneWireTempHUm.c,98 :: 		temp=temp+(oneWireRead()<<8);
STR	R1, [SP, #4]
BL	_oneWireRead+0
LDR	R1, [SP, #4]
LSLS	R0, R0, #8
UXTH	R0, R0
ADDS	R0, R1, R0
; temp end address is: 4 (R1)
; temp start address is: 8 (R2)
MOV	R2, R0
;OneWireTempHUm.c,99 :: 		if(temp & 0xF000)
AND	R0, R0, #61440
CMP	R0, #0
IT	EQ
BEQ	L__calcTemp24
;OneWireTempHUm.c,101 :: 		temp=(~temp)&0x0000FFFF;
MVN	R1, R2
; temp end address is: 8 (R2)
MOVW	R0, #65535
AND	R0, R1, R0, LSL #0
;OneWireTempHUm.c,102 :: 		temp=temp+1;
ADDS	R0, R0, #1
;OneWireTempHUm.c,103 :: 		temp=-temp;
RSBS	R0, R0, #0
; temp start address is: 4 (R1)
MOV	R1, R0
; temp end address is: 4 (R1)
MOV	R0, R1
;OneWireTempHUm.c,104 :: 		}
IT	AL
BAL	L_calcTemp9
L__calcTemp24:
;OneWireTempHUm.c,99 :: 		if(temp & 0xF000)
MOV	R0, R2
;OneWireTempHUm.c,104 :: 		}
L_calcTemp9:
;OneWireTempHUm.c,105 :: 		tempF=temp*1.0/16.0;
; temp start address is: 0 (R0)
VMOV	S1, R0
VCVT.F32	#1, S1, S1
; temp end address is: 0 (R0)
VMOV.F32	S0, #16
VDIV.F32	S0, S1, S0
;OneWireTempHUm.c,106 :: 		return tempF;
VMOV.F32	S0, S0
;OneWireTempHUm.c,107 :: 		}
L_end_calcTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _calcTemp
_calcHumTemp:
;OneWireTempHUm.c,109 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
; i start address is: 12 (R3)
SUB	SP, SP, #24
STR	LR, [SP, #0]
;OneWireTempHUm.c,110 :: 		uint32_t result = 1, i = 0;
;OneWireTempHUm.c,109 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
;OneWireTempHUm.c,110 :: 		uint32_t result = 1, i = 0;
;OneWireTempHUm.c,109 :: 		float calcHumTemp(uint8_t humB){    //5.2 MCU SENDS OUT START SIGNAL TO DHT (FIGURE 3, BELOW)
STRB	R0, [SP, #16]
; i end address is: 12 (R3)
;OneWireTempHUm.c,110 :: 		uint32_t result = 1, i = 0;
; i start address is: 12 (R3)
MOV	R3, #0
;OneWireTempHUm.c,112 :: 		float res=0;
MOV	R0, R3
; i end address is: 12 (R3)
;OneWireTempHUm.c,113 :: 		for(i;i<5;i++)
L_calcHumTemp10:
; i start address is: 0 (R0)
CMP	R0, #5
IT	CS
BCS	L_calcHumTemp11
;OneWireTempHUm.c,114 :: 		array[i] = 0;
ADD	R1, SP, #8
ADDS	R2, R1, R0
MOVS	R1, #0
STRB	R1, [R2, #0]
;OneWireTempHUm.c,113 :: 		for(i;i<5;i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 12 (R3)
MOV	R3, R1
;OneWireTempHUm.c,114 :: 		array[i] = 0;
MOV	R0, R3
; i end address is: 12 (R3)
IT	AL
BAL	L_calcHumTemp10
L_calcHumTemp11:
;OneWireTempHUm.c,116 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;OneWireTempHUm.c,117 :: 		HUM_OUT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R2, #lo_addr(ODR7_GPIOC_ODR_bit+0)
MOVT	R2, #hi_addr(ODR7_GPIOC_ODR_bit+0)
STR	R1, [R2, #0]
;OneWireTempHUm.c,118 :: 		HUM_OUT = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;OneWireTempHUm.c,119 :: 		my_Delay_ms(18);
MOVS	R0, #18
BL	_my_Delay_ms+0
;OneWireTempHUm.c,120 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;OneWireTempHUm.c,121 :: 		my_Delay_us(70);
MOVS	R0, #70
BL	_my_Delay_us+0
;OneWireTempHUm.c,123 :: 		my_Delay_us(130);
MOVS	R0, #130
BL	_my_Delay_us+0
;OneWireTempHUm.c,125 :: 		i=0;
; i start address is: 20 (R5)
MOVS	R5, #0
; i end address is: 20 (R5)
;OneWireTempHUm.c,126 :: 		for(i;i<40;i++){
L_calcHumTemp13:
; i start address is: 20 (R5)
CMP	R5, #40
IT	CS
BCS	L_calcHumTemp14
; i end address is: 20 (R5)
MOV	R0, R5
;OneWireTempHUm.c,127 :: 		while(HUM_IN == 0); //CEKAJ UPOSLENO!
L_calcHumTemp16:
; i start address is: 0 (R0)
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp17
IT	AL
BAL	L_calcHumTemp16
L_calcHumTemp17:
;OneWireTempHUm.c,128 :: 		my_Delay_us(50);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;OneWireTempHUm.c,129 :: 		if(HUM_IN == 0)
MOVW	R2, #lo_addr(IDR7_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR7_GPIOC_IDR_bit+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp18
;OneWireTempHUm.c,130 :: 		array[i/8] |= HUM_IN<<(7-i%8);
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
BAL	L_calcHumTemp19
L_calcHumTemp18:
;OneWireTempHUm.c,133 :: 		array[i/8] |= HUM_IN<<(7-i%8);
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
;OneWireTempHUm.c,134 :: 		my_Delay_us(50);
STR	R0, [SP, #4]
MOVS	R0, #50
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;OneWireTempHUm.c,135 :: 		}
L_calcHumTemp19:
;OneWireTempHUm.c,126 :: 		for(i;i<40;i++){
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 20 (R5)
MOV	R5, R1
;OneWireTempHUm.c,136 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_calcHumTemp13
L_calcHumTemp14:
;OneWireTempHUm.c,138 :: 		if(humB==0)
LDRB	R1, [SP, #16]
CMP	R1, #0
IT	NE
BNE	L_calcHumTemp20
;OneWireTempHUm.c,140 :: 		res=array[2]&0x7F;
ADD	R3, SP, #8
ADDS	R1, R3, #2
LDRB	R2, [R1, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;OneWireTempHUm.c,141 :: 		res=res*25.6+array[3]*0.1;
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
;OneWireTempHUm.c,142 :: 		if(array[2]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp21
;OneWireTempHUm.c,143 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp21:
;OneWireTempHUm.c,144 :: 		}
IT	AL
BAL	L_calcHumTemp22
L_calcHumTemp20:
;OneWireTempHUm.c,147 :: 		res=array[0]&0x7F;
ADD	R3, SP, #8
LDRB	R2, [R3, #0]
AND	R1, R2, #127
UXTB	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
;OneWireTempHUm.c,148 :: 		res=res*25.6+array[1]*0.1;
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
;OneWireTempHUm.c,149 :: 		if(array[0]&0x80)
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_calcHumTemp23
;OneWireTempHUm.c,150 :: 		res=-res;
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp23:
;OneWireTempHUm.c,151 :: 		}
L_calcHumTemp22:
;OneWireTempHUm.c,152 :: 		return res;
VLDR	#1, S0, [SP, #20]
;OneWireTempHUm.c,153 :: 		}
L_end_calcHumTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _calcHumTemp
